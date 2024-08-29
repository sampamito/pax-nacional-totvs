#include 'protheus.ch'
#include 'topconn.ch'

/*/{Protheus.doc} SACI008
-------------------------------------
Executado ap�s gravar todos 
os dados da baixa a receber.
Neste momento todos os registros
j� foram atualizados e destravados
e a contabilizacao efetuada.
-------------------------------------
@author TOTVS
@since 05/05/2016
@version 1.0
/*/
User Function SACI008()

Local aArea			:= GetArea()
Local lFuneraria	:= SuperGetMV("MV_XFUNE",,.F.)

if lFuneraria

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////  CHAMO FUN��O QUE VERIFICA SE O CONTRATO PODE SER FINALIZADO //////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	FWMsgRun(,{|oSay| U_RFUNA024(SE1->E1_XCTRFUN)},'Aguarde...','Verificando o Status do Contrato da Funer�ria...')

Endif

RestArea(aArea)

Return()
