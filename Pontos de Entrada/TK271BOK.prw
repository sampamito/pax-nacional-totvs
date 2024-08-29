#INCLUDE "TOTVS.CH"

 /*/{Protheus.doc} TK271BOK
    Esse ponto de entrada � chamado no bot�o "OK" da barra de ferramentas da tela de atendimento do Call Center
    , antes da fun��o de grava��o.
    @type  Function
    @author Lorran Ferreira
    @since 19/06/2024
/*/
User Function TK271BOK()

    Local aArea := FwGetArea()
    Local lRet := .T.

    // Valida��o da Renegocia��o financeira Virtus.
    If lRet
        lRet := U_RUTIL062()
    EndIf

    FwRestArea(aArea)

Return(lRet)
