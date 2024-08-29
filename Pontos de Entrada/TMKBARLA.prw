#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} TMKBARLA
    O ponto de entrada � chamado na cria��o da tela do Atendimento do Call Center,
    com o objetivo de incluir bot�es de usu�rio na toolbar lateral.
    @type function
    @author Lorran Ferreira
    @since 14/06/2024
    @param aBotao, array, Bot�es na toolbar lateral do Call Center
    @param aTitulo, array, T�tulo dos folders
    @return array, Array com os bot�es da toolbar lateral do Call Center
    @obs 
    A quantidade de bot�es ir� depender da resolu��o de tela e tamb�m das polegadas do monitor utilizado.
    Dependendo da resolu��o de tela, os �ltimos bot�es poder�o sair cortados nas janelas dos atendimentos.
    aBotao[n,1]: Nome do Bitmap
    aBotao[n,2]: Nome da fun��o que ser� executada
    aBotao[n,3]: Mensagem que ser� exibida quando o mouse passar sobre o bot�o
/*/
User Function TMKBARLA(aBotao, aTitulo)
    
    // Adiciona bot�es na toolbar lateral do Call Center da melhorias de atendimento.
    U_RUTIL064(@aBotao)

Return aBotao
