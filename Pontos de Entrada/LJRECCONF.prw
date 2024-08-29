#INCLUDE "PROTHEUS.CH"

/*/{Protheus.doc} LJRECCONF
-----------------------------------------------------------
O ponto de entrada LJRECCONF
est� localizado antes da fun��o
de estorno do recebimento de
t�tulos, no m�dulo Controle de Lojas,
rotina Venda Assistida, que permite
fazer customiza��es na op��o Recebimentos (CTRL+D)

LJRECCONF - ( [ cOper ], [ nTotal ], [ aTitulo ] ) --> lRet
Retorno:
- lRet (logico)
- Retorno l�gico:
- True (.T.) = Confirma
- False (.F.) = N�o confirma
-----------------------------------------------------------
@type function
@version 1.0
@author nata.queiroz
@since 14/04/2020
@return lRet, logic
/*/
User Function LJRECCONF()
	Local lRet := .T.
	Local aArea := GetArea()
	Local cOpc := PARAMIXB[1]
	Local aTit := PARAMIXB[3]
	Local nX := 0

	If cOpc == "2"

		If FindFunction("U_UVIND18")
			For nX := 1 To Len(aTit)

				//-- aTit[nX][1]  => Flag marcada
				//-- aTit[nX][2]  => Prefixo
				//-- aTit[nX][3]  => Titulo
				//-- aTit[nX][4]  => Parcela
				//-- aTit[nX][11] => Tipo

				If aTit[nX][1]
					//-- Valida atualiza��o em t�tulos que est�o em recorr�ncia
					lRet := U_UVIND18(aTit[nX][2], aTit[nX][3], aTit[nX][4], aTit[nX][11])
					
					If !lRet
						Exit
					EndIf
				EndIf

			Next nX
		EndIf

	EndIf

	RestArea(aArea)

Return lRet
