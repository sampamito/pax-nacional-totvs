#include "totvs.ch"

/*/{Protheus.doc} MTGRVVLD
Ponto de entrada validar a gravacao das alteracoes 
do banco de conhecimento 
@type function
@version 1.0
@author g.sampaio
@since 03/04/2024
@return logical, retorno da validacao
/*/
User Function MTGRVVLD()

	Local lRetorno              := .F.

	If ExistBlock("RTILE81G")
		lRetorno := U_RTILE81G()
	EndIf

Return(lRetorno)
