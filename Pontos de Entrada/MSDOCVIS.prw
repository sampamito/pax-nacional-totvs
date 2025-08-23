#include "totvs.ch"

/*/{Protheus.doc} MSDOCVIS
MSDOCVIS - Ponto de Entrada utilizado 
para somente visualizar o Conhecimento 
@type function
@version 1.0
@author g.sampaio
@since 03/04/2024
@return logical, retorno logico da funcao
/*/
User Function MSDOCVIS()

	Local lRetorno              := .T.

	If ExistBlock("RTILE81D")
		lRetorno := U_RTILE81D()
	EndIf

Return(lRetorno)
