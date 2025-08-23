#include 'protheus.ch'

/*/{Protheus.doc} FA070POS
Executado antes da montagem da tela de baixa do contas a receber.
@author TOTVS
@since 04/08/2016
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function FA070POS()
/***********************/

	// -- veerifico se o programa esta compilado
	If ExistBlock("RUTILE96")
		U_RUTILE96(SE1->(Recno()))
	EndIf 

Return(Nil)
