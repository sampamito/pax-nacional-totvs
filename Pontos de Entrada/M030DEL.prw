#Include 'Protheus.ch'
#INCLUDE "topconn.ch"
#INCLUDE "TbiConn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � M030DEL � Autor � Wellington Gon�alves � Data � 17/08/2016 ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de entrada para validar a exclus�o do cliente		  ���
�������������������������������������������������������������������������͹��
���Uso       � Cemit�rio e Funer�ria                                      ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function M030DEL()

Local aArea			:= GetArea()
Local aAreaSA1		:= SA1->(GetArea())
Local lFuneraria	:= SuperGetMV("MV_XFUNE",,.F.)
Local lCemiterio	:= SuperGetMV("MV_XCEMI",,.F.)
Local lRet			:= .T.
Local cQry			:= ""
Local cPulaLinha	:= chr(13)+chr(10)

if lFuneraria

	// verifico se existe este alias criado
	If Select("QRY") > 0
		QRY->(DbCloseArea())
	EndIf 
	
	cQry := " SELECT " 										+ cPulaLinha
	cQry += " UF2.UF2_FILIAL AS FILIAL, " 					+ cPulaLinha
	cQry += " UF2.UF2_CODIGO AS CONTRATO " 					+ cPulaLinha
	cQry += " FROM " 										+ cPulaLinha
	cQry += " " + RetSqlName("UF2") + " UF2 " 				+ cPulaLinha
	cQry += " WHERE " 										+ cPulaLinha
	cQry += " UF2.D_E_L_E_T_ <> '*' " 						+ cPulaLinha
	cQry += " AND UF2.UF2_CLIENT = '" + SA1->A1_COD + "' " 	+ cPulaLinha
	cQry += " AND UF2.UF2_LOJA = '" + SA1->A1_LOJA + "' " 	+ cPulaLinha
	cQry += " UNION " 										+ cPulaLinha
	cQry += " SELECT " 										+ cPulaLinha
	cQry += " UF5.UF5_FILIAL AS FILIAL, " 					+ cPulaLinha
	cQry += " UF5.UF5_CTRFUN AS CONTRATO " 					+ cPulaLinha
	cQry += " FROM " 										+ cPulaLinha
	cQry += " " + RetSqlName("UF5") + " UF5 " 				+ cPulaLinha
	cQry += " WHERE " 										+ cPulaLinha
	cQry += " UF5.D_E_L_E_T_ <> '*' " 						+ cPulaLinha
	cQry += " AND UF5.UF5_CLIANT = '" + SA1->A1_COD + "' "	+ cPulaLinha
	cQry += " AND UF5.UF5_LOJANT = '" + SA1->A1_LOJA + "' "	+ cPulaLinha	   
	
	// fun��o que converte a query gen�rica para o protheus
	cQry := ChangeQuery(cQry)
	
	// crio o alias temporario
	TcQuery cQry New Alias "QRY" // Cria uma nova area com o resultado do query   
	
	// se existir contratos da funer�ria vinculados ao cliente
	if QRY->(!Eof()) 
		lRet := .F.
		MsgAlert("N�o � poss�vel excluir o cliente, pois est� vinculado ao contrato da Funer�ria " + AllTrim(QRY->CONTRATO) + " filial " + AllTrim(QRY->FILIAL) + ".")
	endif
	
	// fecho a �rea criada
	If Select("QRY") > 0
		QRY->(DbCloseArea())
	EndIf 

endif

if lRet .AND. lCemiterio

	// verifico se existe este alias criado
	If Select("QRY") > 0
		QRY->(DbCloseArea())
	EndIf 
	
	cQry := " SELECT " 										+ cPulaLinha
	cQry += " U00.U00_FILIAL AS FILIAL, " 					+ cPulaLinha
	cQry += " U00.U00_CODIGO AS CONTRATO " 					+ cPulaLinha
	cQry += " FROM " 										+ cPulaLinha
	cQry += " " + RetSqlName("U00") + " U00 " 				+ cPulaLinha
	cQry += " WHERE " 										+ cPulaLinha
	cQry += " U00.D_E_L_E_T_ <> '*' " 						+ cPulaLinha
	cQry += " AND U00.U00_CLIENT = '" + SA1->A1_COD + "' " 	+ cPulaLinha
	cQry += " AND U00.U00_LOJA = '" + SA1->A1_LOJA + "' " 	+ cPulaLinha
	cQry += " UNION " 										+ cPulaLinha
	cQry += " SELECT " 										+ cPulaLinha
	cQry += " U19.U19_FILIAL AS FILIAL, " 					+ cPulaLinha
	cQry += " U19.U19_CONTRA AS CONTRATO "					+ cPulaLinha
	cQry += " FROM " 										+ cPulaLinha
	cQry += " " + RetSqlName("U19") + " U19 " 				+ cPulaLinha
	cQry += " WHERE " 										+ cPulaLinha
	cQry += " U19.D_E_L_E_T_ <> '*' " 						+ cPulaLinha
	cQry += " AND U19.U19_CLIANT = '" + SA1->A1_COD + "' " 	+ cPulaLinha
	cQry += " AND U19.U19_LOJANT = '" + SA1->A1_LOJA + "' "	+ cPulaLinha	   
	
	// fun��o que converte a query gen�rica para o protheus
	cQry := ChangeQuery(cQry)
	
	// crio o alias temporario
	TcQuery cQry New Alias "QRY" // Cria uma nova area com o resultado do query   
	
	// se existir contratos da funer�ria vinculados ao cliente
	if QRY->(!Eof()) 
		lRet := .F.
		MsgAlert("N�o � poss�vel excluir o cliente, pois est� vinculado ao contrato do Cemit�rio " + AllTrim(QRY->CONTRATO) + " filial " + AllTrim(QRY->FILIAL) + ".")
	endif
	
	// fecho a �rea criada
	If Select("QRY") > 0
		QRY->(DbCloseArea())
	EndIf 

endif

RestArea(aAreaSA1)
RestArea(aArea)

Return(lRet)