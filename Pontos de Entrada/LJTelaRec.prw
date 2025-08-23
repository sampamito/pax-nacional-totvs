#INCLUDE "TOTVS.CH"

/*/ {Protheus.doc} User Function LJTelaRec
Este Ponto de Entrada tem por objetivo substituir a tela padrão de Recebimento de Títulos.
O Ponto de entrada é executado antes da chamada da tela de Recebimento de Títulos para substituir a tela padrão.
@type Function
@author Lorran Ferreira
@since 08/07/2025
/*/
User  Function LJTelaRec( aRet, cMV_LJRECEB, cRecCart, cRecCPF, cRecCont, lOcioso, aTitulo )

    Local cMod := U_RetModul()
    Local lPadrao := .T.

    If cMod == "FUN" .And. Existblock("RUTLT114A") .And. cMV_LJRECEB == "1"
        lPadrao := .F.
	    U_RUTLT114A( @aRet, cMV_LJRECEB, cRecCart, cRecCPF, cRecCont, lOcioso, aTitulo )
    Endif

Return(lPadrao)
