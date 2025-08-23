#include "totvs.ch"

/*/{Protheus.doc} FT340VLD
FT340VLD: Valida se o usuário tem permissão para incluir, alterar ou excluir documentos
@type function
@version 1.0
@author g.sampaio
@since 03/04/2024
@return logical, retorno se o usuário tem permissão ou não
/*/
User Function FT340VLD()

	Local lRetorno              := .T.
	Local nOpc                  := ParamIXB[01] as numeric

	If ExistBlock("RTILE81E")
		lRetorno := U_RTILE81E(nOpc)
	EndIf

Return(lRetorno)
