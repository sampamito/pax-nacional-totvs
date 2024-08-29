#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} FTVD7002
    Ponto de Entrada chamado depois da gravação de todos os dados e da impressão do cupom fiscal na Venda Assistida e após o processamento do Job LjGrvBatch.
    @type user function
    @author Lorran Ferreira
    @since 02/06/2024
    @obs
    PARAMIXB(Array)
    PARAMIXB[1] // (1-orcamento  2-venda  3-pedido)
    PARAMIXB[2] // Array com dados para devolução
/*/
User Function FTVD7002()

    Local aArea 		:= FwGetArea()
    Local aAreaSL1 		:= SL1->(FwGetArea())
    Local aAreaSL2 		:= SL2->(FwGetArea())
	Local nTipo			:= Paramixb[1]					//Recebe nTipo (1-orcamento  2-venda  3-pedido)

    // Verifica se é venda.
    If !IsBlind() .And. (nTipo == 2 .Or. nTipo == 3) .And. Type("M->LQ_NUM")=='C' .And. M->LQ_NUM==SL1->L1_NUM
        
        // Gera o recibo de venda no formato fwmsprinter
        FwMsgRun(NIL, {|oSay| CursorWait(), U_RUTILR21() ,CursorArrow() }, "Aguarde...", "Gerando Recibo de venda...")

    EndIf

    FwRestArea(aAreaSL1)
    FwRestArea(aAreaSL2)  
    FwRestArea(aArea)

Return
