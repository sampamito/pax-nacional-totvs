#INCLUDE "TOTVS.CH"
	//----------------------------------------------------------------
	//| Estrutura do array aPgtos                                    |
	//----------------------------------------------------------------
	//| [1] - Data de pagamento das parcelas                         |
	//| [2] - Valor da parcelas                                      |
	//| [3] - Forma de Pagamento                                     |
	//| [4] - Codigo da Administradora financeira                    |
	//| [5] - Coluna Customizada pelo ponto de entrada LJ7012        |
	//| [6] - Moeda(Localizacoes)                                    |
	//| [7] - Data de emissao(Localizacoes)                          |
	//| [8] - Sequencia para controle de múltiplas transaçõies		 |
	//| [9] - Sequencia para controle de multiplas transacoes Cheque |
	//| [10] - Moeda MultiNegociacao								 |
	//| [11] - Desconto MultiNegociacao								 |
	//| [12] - Conta Hotel											 |
	//| [13] - Array com Informacoes de TEF							 |
	//| [14] - Informacoes IDCNAB									 |
	//| [15] - NSU													 |
	//| [16] - Valor de Juros do Cartão								 |
	//| [17] - Usa Multi Negociacao									 |
	//----------------------------------------------------------------	
	
/*/ {Protheus.doc} FTVD7021
	Esse ponto de entrada é chamado após a confirmação dos dados de pagamento (cheque ou cartão), depois da confirmação da venda.
	@type User Function
	@author Lorran Ferreira
	@since 15/07/2025
/*/
User Function FTVD7021()

    Local lCancela   := PARAMIXB[01]
    Local nVlrPixDC  := 0
    Local nPosTXID   := 5 // Posição do TXID no array de pagamentos
    Local nPosVlr    := 2
	Local nPosForma  := 3
	Local cTxIdPix 	 := ""
	Local nI 	 	 := 0
	
    // Verifica a existencia de Pix
    If !lCancela .And. ExistBlock("GDCPgtoPix")
	
		For nI := 1 To Len(oPgTos:AARRAY)

			If oPgTos:AARRAY[nI][nPosForma] == "PIX"

				nVlrPixDC := oPgTos:AARRAY[nI][nPosVlr]

				lCancela := U_GDCPgtoPix( nVlrPixDC , @cTxIdPix )

				If !lCancela .And. !Empty(cTxIdPix)
					// Atualiza o TXID no array de pagamentos
					oPgTos:AARRAY[nI][nPosTXID] := cTxIdPix
				ElseIf lCancela
					Exit
				Endif

			EndIf

		Next nI

    EndIf

Return lCancela

