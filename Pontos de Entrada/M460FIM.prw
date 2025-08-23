#include 'protheus.ch'

/*/{Protheus.doc} M460FIM
Chamado após a gravação da NF de Saída, e fora da transação
@author TOTVS
@since 22/09/2016
@version P11
@param Nao recebe parametros
@return nulo
/*/

User Function M460FIM()

	Local aArea 		:= GetArea()
	Local aAreaSC5 		:= SC5->(GetArea())
	Local aAreaSE1      := SE1->(GetArea())
	Local lFuneraria	:= SuperGetMV("MV_XFUNE",.F.,.F.)
	Local lCemiterio    := SuperGetMV("MV_XCEMI",.F.,.F.)

    // -- gravo informacoes do contrato na tabela SE1
	If (lFuneraria .Or. lCemiterio) .And. ExistBlock("RUTLE116")
        U_RUTLE116()
	Endif

	RestArea(aAreaSE1)
	RestArea(aAreaSC5)
	RestArea(aArea)

Return(Nil)
