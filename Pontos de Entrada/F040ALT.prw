#include 'protheus.ch'

/*/{Protheus.doc} F040ALT
Valida os dados da alteração apos a confirmação da mesma
@author TOTVS
@since 19/11/2018
@version P12
@param Nao recebe parametros
@return nulo
/*/

/**********************/
User Function F040ALT()
/**********************/
	
	Local aArea			:= GetArea()
	Local aAreaSE1		:= SE1->(GetArea())

	// verifico se o programa esta compilado
	If ExistBlock("UVIND23")
		U_UVIND23(SE1->(Recno()))
	EndIf

	RestArea(aAreaSE1)
	RestArea(aArea)

Return()
