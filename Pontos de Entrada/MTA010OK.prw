#Include 'Protheus.ch'
#INCLUDE "topconn.ch"
#INCLUDE "TbiConn.ch"

/*/{Protheus.doc} MTA010OK
Ponto de entrada para validar a exclusão do produto
@type function
@version 1.0
@author g.sampaio
@since 03/11/2024
@return logical, retorno da validação
/*/
User Function MTA010OK()

	Local aArea			:= GetArea()
	Local aAreaSB1		:= SB1->(GetArea())
	Local lRet			:= .T.

	If ExistBlock("RUTLE106")
		lRet := U_RUTLE106()
	EndIf

	RestArea(aAreaSB1)
	RestArea(aArea)

Return(lRet)
