#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

#DEFINE CRLF CHR(13)+CHR(10)

/*/{Protheus.doc} M530AGL
O ponto de entrada M530FIL existe na fun��o fa530Processa "Atualiza��o do Pagamento de Comiss�es (MATA530)" 
e ser� disparado para filtrar os vendedores conforme os par�metros dos clientes.

Esta sendo utilizado para filtrar as comiss�es cujos os t�tulos j� tenham sido recebidos (baixados).

@author pablocavalcante
@since 21/06/2016
@version undefined

@type function
/*/

User Function M530FIL()

	Local cRet := "U_SE1FILTR()"

Return(cRet)

//
// Filtro para a SE3: somente os titulos da SE1 que ja tenham sido recebidos (baixados). 
//
User Function SE1FILTR()

	Local aEstSE3 			:= SE3->(GetArea())
	Local lRet 				:= .T.
	Local lFuneraria		:= SuperGetMV("MV_XFUNE",,.F.)
	Local lCemiterio		:= SuperGetMV("MV_XCEMI",,.F.)
	Local oComissaoVirtus	:= Nil

	// comissao virtus
	oComissaoVirtus	:= ComissaoVirtus():New()

	If (lCemiterio .And. !Empty(SE3->E3_XCONTRA)) .Or. (lFuneraria .And. !Empty(SE3->E3_XCTRFUN))
		lRet := oComissaoVirtus:ValPagComissao(SE3->(Recno()))
	EndIf

	RestArea(aEstSE3)

Return(lRet)
