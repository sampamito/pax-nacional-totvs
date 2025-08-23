#include "totvs.ch"

/*/{Protheus.doc} MTVLDACE
Ponto de entrada validar o acesso a rotina quando chamada pelo menu
https://tdn.totvs.com/pages/releaseview.action?pageId=6085698
@type function
@version 1.0
@author g.sampaio
@since 03/04/2024
@return logical, retorno logio da funcao
/*/
User Function MTVLDACE()

	Local lRetorno              := .T.

	If ExistBlock("RTILE81B")
		lRetorno := U_RTILE81B()
	EndIf

Return(lRetorno)
