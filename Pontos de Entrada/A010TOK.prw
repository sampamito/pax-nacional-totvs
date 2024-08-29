#include "totvs.ch"

/*/{Protheus.doc} A010TOK
LOCALIZA��O : Function A010TudoOK - Fun��o de Valida��o para 
inclus�o ou altera��o do Produto.

EM QUE PONTO: No in�cio das valida��es ap�s a confirma��o da 
inclus�o ou altera��o, antes da grava��o do Produto; deve 
ser utilizado para valida��es adicionais para a INCLUS�O ou ALTERA��O do Produto.

Eventos

@type function
@version 1.0 
@author totvs
@since 06/05/2021
@return logical, Deve retornar .T. se valida��o OK, para continuar e incluir ou atualizar o produto ou .F. para retornar a tela de inclusao ou alteracao, interrompendo o processo.
/*/
User Function A010TOK()

	Local lRetorno := .T.

	// executo a valida
	if ExistBlock("RCPGE067") .And. ALTERA
		lRetorno := U_RCPGE067( SB1->B1_COD, M->B1_XTPCEM )
	endIf

Return(lRetorno)
