#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} TMKCFIM
    Esse ponto de entrada � chamado ap�s a grava��o do atendimento na rotina do Telecobran�a,
    com o objetivo de executar comandos diversos ap�s essa grava��o.
    @type  Function
    @author Lorran Ferreira
    @since 21/06/2024
    @see  https://tdn.totvs.com/pages/releaseview.action?pageId=6787779
/*/
User Function TMKCFIM()

    // Executa a liquida��o da negocia��o financeira.
    U_RUTIL063()
    
Return 
