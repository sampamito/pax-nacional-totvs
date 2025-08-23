#include "totvs.ch"

/*/{Protheus.doc} MSDOCEXC
PE usado para impedir que usuarios não autorizados e com status diferente 
de somente "visualiza" (conforme PE MSDOCVIS) possa Excluir o conhecimento.
Se a Função retornar .F. o usuario pode incluir, excluir. Se voltar .T. 
somente pode incluir.
@type function
@version 1.0
@author g.sampaio
@since 03/04/2024
@return logical, retorno logico da funcao
/*/
User Function MSDOCEXC()

	Local lRetorno              := .T.

	If ExistBlock("RTILE81C")
		lRetorno := U_RTILE81C()
	EndIf

Return(lRetorno)
