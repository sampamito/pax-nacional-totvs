#Include 'Protheus.ch'
#INCLUDE "topconn.ch"
#INCLUDE "TbiConn.ch"

/*/{Protheus.doc} MT410ACE
Ponto de entrada para validar a exclusão do pedido de venda
@type function
@version 1.0
@author Wellington Gonçalves
@since 23/08/2016
@return logical, retorno da validação
/*/
User Function MT410ACE()

	Local aArea			:= GetArea()
	Local aAreaSC5		:= SC5->(GetArea())
	Local lRet 			:= .T.
	Local nOpc  		:= PARAMIXB[1]

	If ExistBlock("RUTLE104")
		lRet := U_RUTLE104(nOpc)
	EndIf

	RestArea(aAreaSC5)
	RestArea(aArea)

Return(lRet)
