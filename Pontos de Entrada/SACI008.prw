#include 'protheus.ch'
#include 'topconn.ch'

/*/{Protheus.doc} SACI008
-------------------------------------
Executado após gravar todos 
os dados da baixa a receber.
Neste momento todos os registros
já foram atualizados e destravados
e a contabilizacao efetuada.
-------------------------------------
@author TOTVS
@since 05/05/2016
@version 1.0
/*/
User Function SACI008()

	Local aArea			:= GetArea()
	Local lFuneraria	:= SuperGetMV("MV_XFUNE",,.F.)
	Local cChave 		:= SE1->(E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO+E1_CLIENTE+E1_LOJA)
	Local cArqTrab 		:= GetNextAlias()
	Local cQry 			:= ""

	If lFuneraria

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////  CHAMO FUNÇÃO QUE VERIFICA SE O CONTRATO PODE SER FINALIZADO //////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		FWMsgRun(,{|oSay| U_RFUNA024(SE1->E1_XCTRFUN)},'Aguarde...','Verificando o Status do Contrato da Funerária...')

		If !Empty(SE1->E1_PORTADO) .AND. ExistBlock("RUTIL115") //DTGD-51 Integracao hub bancario

			cQry := "SELECT EE_XHUBB FROM " + RetSqlName("SEE") + " A "
			cQry += " WHERE  A.D_E_L_E_T_='' AND EE_FILIAL = '" + xFilial("SEE") + "' AND EE_CODIGO  = '" + SE1->E1_PORTADO + "'"
			cQry += " AND EE_AGENCIA = '" + SE1->E1_AGEDEP + "'"
			cQry += " AND EE_CONTA   = '" + SE1->E1_CONTA + "'"

			MPSysOpenQuery(cQry, cArqTrab)

			If (cArqTrab)->EE_XHUBB == '1'
				U_RUTIL115(cChave,1)
			Endif

		Endif

	Endif

	RestArea(aArea)

Return(Nil)
