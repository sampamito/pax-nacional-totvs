#include "totvs.ch"

/*/{Protheus.doc} MA030TOK
TUDOK DA INCLUS�O E ALTERA��O 
Na TudOK (valida��o da digita��o) na inclus�o e altera��o de clientes.
@type function
@version 1.0
@author g.sampaio
@since 19/03/2021
@return logical, retorno se o cadastro esta ok
/*/
User Function MA030TOK()

    Local lValidaCliente    := SuperGetMV("MV_XCADCLI",.F.,.F.)
	Local lRetorno          := .T.

	if lValidaCliente .And. !FWIsInCallStack("processarVendas")

        // veririfico se o campo de ddd do telefone esta preenchido
        If lRetorno .And. Empty(M->A1_DDD)
            lRetorno := .F.
            Help(,,'Help',,"Campo DDD (A1_DDD) n�o preenchido, favor preencher o campo para prosseguir com o cadastro do cliente!",1,0)
        endIf

        // veririfico se o campo de telefone esta preenchido
        If lRetorno .And. Empty(M->A1_TEL)
            lRetorno := .F.
            Help(,,'Help',,"Campo Telefone (A1_TEL) n�o preenchido, favor preencher o campo para prosseguir com o cadastro do cliente!",1,0)
        endIf

	endIf

Return(lRetorno)
