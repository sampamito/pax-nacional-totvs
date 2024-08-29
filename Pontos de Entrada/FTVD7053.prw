#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} FTVD7053
    Ponto de Entrada executado na sele��o da op��o no Venda direta, 
    Onde permite acrescentar mais op��es de bot�es no menu da tela.
    @type function
    @author Lorran Ferreira
    @since 28/05/2024
    @return array, Retorna o array com as novas rotinas do menu. 
/*/
User Function FTVD7053()

    Local aArray  as array

    aArray := {}

    /*
    Par�metros do array aRotina: 
    1. Nome a aparecer no cabe�alho 
    2. Nome da Rotina associada 
    3. Reservado 
    4. Tipo de Transa��o a ser efetuada: 
        4.1 - Pesquisa e Posiciona em um Banco de Dados 
        4.2 - Simplesmente Mostra os Campos 
        4.3 - Inclui registros no Bancos de Dados 
        4.4 - Altera o registro corrente 
        4.5 - Remove o registro corrente do Banco de Dados 
    5. N�vel de acesso 
    6. Habilita Menu Funcional 
    */
	aAdd( aArray, { "Reimpress�o do Recibo de Venda", "U_RUTILR21(.T.)" , 0, 1, , .F. } )    

Return aArray
