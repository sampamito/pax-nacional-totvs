/*/{Protheus.doc} MT120FIL
Filtro da FilBrowse do Pedido de Compras (MATA120)
@type function
@version 1.0  
@author TOTVS
@since 21/10/2022
/*/

User Function MT120FIL()

	Local cRet      := ""

	If ExistBlock("RUTLE103")
		cRet := U_RUTLE103()
	EndIf

Return(cRet)
