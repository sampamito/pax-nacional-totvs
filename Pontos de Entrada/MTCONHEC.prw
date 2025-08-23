#include "totvs.ch"

/*/{Protheus.doc} MTCONHEC
Ponto de entrada para bloquear o botão "Banco Conhecimento para alguns usuários
@type function
@version 1.0
@author g.sampaio
@since 03/04/2024
@return logical, retorno se o usuário tem acesso ou não ao botão
/*/
User Function MTCONHEC()

	Local lRetorno              := .T.

	If ExistBlock("RTILE81F")
		lRetorno := U_RTILE81F()
	EndIf

Return(lRetorno)
