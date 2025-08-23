#INCLUDE "TOTVS.CH"

#DEFINE TIT_SELE  1			// Posicao logica.
#DEFINE TIT_PREF  2			// Prefixo do titulo.
#DEFINE TIT_NUME  3			// Titulo.
#DEFINE TIT_PARC  4			// Parcela.
#DEFINE TIT_VREA  5			// Vencimento real.
#DEFINE TIT_VALO  6			// Valor.
#DEFINE TIT_MULT  7			// Multa.
#DEFINE TIT_JURO  8			// Juros.
#DEFINE TIT_DESC  9			// Desconto.
#DEFINE TIT_RECE 10			// Recebimento.
#DEFINE TIT_TIPO 11 		// Tipo.
#DEFINE TIT_CONT 12			// Contrato.
#DEFINE TIT_CLIE 13			// Cliente.
#DEFINE TIT_LOJA 14			// Loja.
#DEFINE TIT_FILI 15       	// Filial.
#DEFINE TIT_RECN 16			// Recno.
#DEFINE TIT_ACRS 17			// Acrescimo financeiro.
#DEFINE TIT_CACR 18			// Posicao logica.
#DEFINE TIT_ABAT 19			// Abatimentos.
#DEFINE TIT_VENC 20			// Vencimento original.
#DEFINE TIT_LOCK 21			// Cod de uso do Registro
#DEFINE TIT_MOED 22			// Codigo da moeda do titulo
#DEFINE TIT_INTE 23			// Interes (Juros) - Posicao reservada
#DEFINE TIT_DTBX 24			// Dt. da baixa
#DEFINE TIT_SALD 25			// Saldo do titulo
#DEFINE TIT_VLIQ 26			// Valor Liquido

/*/ {Protheus.doc} LJRECVLD
    Esse ponto de entrada tem por objetivo validar os valores editados
    (juros, multa, desconto e valor recebido) na alteração de um título.
    @type function
    @author Lorran Ferreira
    @since 06/12/2024
    @return logical, Retorna se a validação está ok.
    @see https://tdn.totvs.com/pages/releaseview.action?pageId=6791003
    @Obs: 
       cTipo: "J" para juros, "M" para multa, "D" para desconto e "V" para valor recebido.
/*/
User Function LJRECVLD()

    Local aArea := FwGetArea()
    Local aAreaSE1 := SE1->(FwGetArea())
    Local lRet  := .T.
    Local cTipo     := ParamIXB[1]
    Local nValor    := ParamIXB[2]
    Local aTitulos  := ParamIXB[3]
    Local oTitulo   := ParamIXB[4]
    Local oRegraDesc    as Object
    Local lAtivRegDesc 		:= SuperGetMv("MV_XFUNRDP",.F.,.T.) // Ativa a Regra de desconto de pagamento	
    Local nPDesc    := 0
    Local nRecnoSE1 := aTitulos[oTitulo:nAt][16]

    // Validações de Desconto
    If cTipo == "D" .And. nValor > 0

        If lRet .And. FindClass("RegraDescontoPagamento") .And. lAtivRegDesc .And. nRecnoSE1 > 0

            SE1->(DbGoTo(nRecnoSE1))

            oRegraDesc := RegraDescontoPagamento():New( "LJRECVLD" ,, SE1->E1_XFORPG )

            If oRegraDesc:lTemRegra .And. oRegraDesc:ValidaRegra(1)

                If oRegraDesc:cTipoDesconto == "1" // Percentual

                    nPDesc := Round( ( nValor / aTitulos[oTitulo:nAt][TIT_RECE] ) * 100  , 2 )
                    
                    If nPDesc > oRegraDesc:nDescontoPermitido
                        lRet := .F.
                        FWAlertError("O percentual de desconto informado é maior que o permitido pela regra de desconto!",;
                                    "Percentual de desconto inválido!")
                    
                    // Valida se o valor do desconto é maior que o valor máximo permitido
                    Elseif oRegraDesc:nValorDescontoMaximo .And. nValor > oRegraDesc:nValorDescontoMaximo

                        lRet := .F.
                        FWAlertError("O valor de desconto informado é maior que o máximo permitido pela regra de desconto!";
                                    +CRLF+"Máximo Permitido: R$ " + AllTrim(Transform(oRegraDesc:nValorDescontoMaximo,"@E 999,999.99")),;
                                    "Valor de desconto inválido!")


                    EndIf
                

                Else // Valor

                    If nValor > oRegraDesc:nDescontoPermitido
                        
                        lRet := .F.
                        FWAlertError("O valor de desconto informado é maior que o permitido pela regra de desconto!",;
                                    "Valor de desconto inválido!")

                    // Valida se o valor do desconto é maior que o valor máximo permitido
                    Elseif oRegraDesc:nValorDescontoMaximo > 0 .And. nValor > oRegraDesc:nValorDescontoMaximo

                        lRet := .F.
                        FWAlertError("O valor de desconto informado é maior que o máximo permitido pela regra de desconto!";
                                    +CRLF+"Máximo Permitido: R$ " + AllTrim(Transform(nVlLimite,"@E 999,999.99")),;
                                    "Valor de desconto inválido!")

                    EndIf

                EndIf

            EndIf

        EndIf

    EndIf

    FwRestArea(aAreaSE1)
    FwRestArea(aArea)

Return(lRet)
