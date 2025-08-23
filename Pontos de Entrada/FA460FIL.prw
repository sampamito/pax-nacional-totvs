#include "totvs.ch"

/*/{Protheus.doc} FA460FIL
Pe na liquiacao para filtrar titulos do contrato
@type function
@author Leandro Rodrigues
@since 17/07/2019
@version P12
@return character, cFiltro
@history 29/05/2020, g.sampaio, VPDV-473 - adicionado tratativa para o contrato de cemiterio RCPGA001
/*/
User Function FA460FIL()

	Local cFiltro := ""

	If ExistBlock("RUTILE97")
		cFiltro := U_RUTILE97()
	EndIf

Return(cFiltro)
