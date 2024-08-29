#include "totvs.ch"

/*/{Protheus.doc} FA60FIL
Filtro de registros processados do border�
O ponto de entrada FA60FIL ser� executado no filtro de registros que ser�o processados para a elabora��o do border�(tipo Indregua).
Para maiores informa��es, consulte: FA60FIL - Filtro de registros processados do border�.
@type function
@version 1.0
@author g.sampaio
@since 11/10/2023
@return character, filtro customizado do ponto de entrada
/*/
User Function FA60FIL()

	Local cMod          := ""
	Local cRetFiltro    := ".T."
	Local lCemiterio    := SuperGetMV("MV_XCEMI", .F., .F.)
	Local lFuneraria    := SuperGetMV("MV_XFUNE", .F., .F.)
	Local lMVFilBordero := SuperGetMV("MV_XFILBOR", .F., .F.)

	If lMVFilBordero .And. (lCemiterio .Or. lFuneraria)
		If MsgNoYes("Gera bordero somente de titulos a receber de contratos com Boleto?", "Filtro Bordero")

			// modulo do contrato
			cMod := U_RetModul()

			If cMod == "CEM"
				cRetFiltro := "!Empty(SE1->E1_NUMBCO) .And. !Empty(SE1->E1_XCONTRA)"
			ElseIf cMod == "FUN"
				cRetFiltro := "!Empty(SE1->E1_NUMBCO) .And. !Empty(SE1->E1_XCTRFUN)"
			EndIf

		EndIf
	EndIf

Return(cRetFiltro)
