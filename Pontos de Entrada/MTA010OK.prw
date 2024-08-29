#Include 'Protheus.ch'
#INCLUDE "topconn.ch"
#INCLUDE "TbiConn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � MTA010OK �Autor � Wellington Gon�alves � Data � 17/08/2016 ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de entrada para validar a exclus�o do produto		  ���
�������������������������������������������������������������������������͹��
���Uso       � Cemit�rio e Funer�ria                                      ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function MTA010OK()

Local aArea			:= GetArea()
Local aAreaSB1		:= SB1->(GetArea())
Local lFuneraria	:= SuperGetMV("MV_XFUNE",,.F.)
Local lCemiterio	:= SuperGetMV("MV_XCEMI",,.F.)
Local lRet			:= .T.
Local cQry			:= ""
Local cPulaLinha	:= chr(13)+chr(10)

if !IsBlind() // n�o ser� validado em rotinas automaticas

	if lFuneraria
	
		// verifico se existe este alias criado
		If Select("QRY") > 0
			QRY->(DbCloseArea())
		EndIf 
		
		cQry := " SELECT " 										+ cPulaLinha
		cQry += " UF1.UF1_FILIAL AS FILIAL, " 					+ cPulaLinha
		cQry += " UF1.UF1_CODIGO AS PLANO, " 					+ cPulaLinha
		cQry += " '' AS CONTRATO " 								+ cPulaLinha
		cQry += " FROM " 										+ cPulaLinha
		cQry += " " + RetSqlName("UF1") + " UF1 " 				+ cPulaLinha
		cQry += " WHERE " 										+ cPulaLinha
		cQry += " UF1.D_E_L_E_T_ <> '*' " 						+ cPulaLinha
		cQry += " AND UF1.UF1_PROD = '" + SB1->B1_COD + "' " 	+ cPulaLinha
		cQry += " UNION " 										+ cPulaLinha
		cQry += " SELECT " 										+ cPulaLinha
		cQry += " UF3.UF3_FILIAL AS FILIAL, " 					+ cPulaLinha
		cQry += " '' AS PLANO, " 								+ cPulaLinha
		cQry += " UF3.UF3_CODIGO AS CONTRATO "					+ cPulaLinha
		cQry += " FROM " 										+ cPulaLinha
		cQry += " " + RetSqlName("UF3") + " UF3 " 				+ cPulaLinha
		cQry += " WHERE " 										+ cPulaLinha
		cQry += " UF3.D_E_L_E_T_ <> '*' " 						+ cPulaLinha
		cQry += " AND UF3.UF3_PROD = '" + SB1->B1_COD + "' " 	+ cPulaLinha   
		
		// fun��o que converte a query gen�rica para o protheus
		cQry := ChangeQuery(cQry)
		
		// crio o alias temporario
		TcQuery cQry New Alias "QRY" // Cria uma nova area com o resultado do query   
		
		// se existir contratos da funer�ria vinculados ao cliente
		if QRY->(!Eof()) 
		
			lRet := .F.
			
			// verifico se o produto tem a amarra��o com os planos do cemit�rio
			// caso n�o tenha, verifico se est� em algum item do contrato
			if !Empty(QRY->PLANO)
				MsgAlert("N�o � poss�vel excluir o produto, pois est� vinculado ao plano da Funer�ria " + AllTrim(QRY->PLANO) + " filial " + AllTrim(QRY->FILIAL) + ".")
			else
				MsgAlert("N�o � poss�vel excluir o produto, pois est� vinculado ao contrato da Funer�ria " + AllTrim(QRY->CONTRATO) + " filial " + AllTrim(QRY->FILIAL) + ".")
			endif
			
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
		cQry += " U06.U06_FILIAL AS FILIAL, " 					+ cPulaLinha
		cQry += " U06.U06_CODIGO AS PLANO, " 					+ cPulaLinha
		cQry += " '' AS CONTRATO " 								+ cPulaLinha
		cQry += " FROM " 										+ cPulaLinha
		cQry += " " + RetSqlName("U06") + " U06 " 				+ cPulaLinha
		cQry += " WHERE " 										+ cPulaLinha
		cQry += " U06.D_E_L_E_T_ <> '*' " 						+ cPulaLinha
		cQry += " AND U06.U06_PRODUT = '" + SB1->B1_COD + "' " 	+ cPulaLinha
		cQry += " UNION " 										+ cPulaLinha
		cQry += " SELECT " 										+ cPulaLinha
		cQry += " U01.U01_FILIAL AS FILIAL, " 					+ cPulaLinha
		cQry += " '' AS PLANO, " 								+ cPulaLinha
		cQry += " U01.U01_CODIGO AS CONTRATO "					+ cPulaLinha
		cQry += " FROM " 										+ cPulaLinha
		cQry += " " + RetSqlName("U01") + " U01 " 				+ cPulaLinha
		cQry += " WHERE " 										+ cPulaLinha
		cQry += " U01.D_E_L_E_T_ <> '*' " 						+ cPulaLinha
		cQry += " AND U01.U01_PRODUT = '" + SB1->B1_COD + "' " 	+ cPulaLinha   
		
		// fun��o que converte a query gen�rica para o protheus
		cQry := ChangeQuery(cQry)
		
		// crio o alias temporario
		TcQuery cQry New Alias "QRY" // Cria uma nova area com o resultado do query   
		
		// se existir contratos da funer�ria vinculados ao cliente
		if QRY->(!Eof()) 
		
			lRet := .F.
			
			// verifico se o produto tem a amarra��o com os planos do cemit�rio
			// caso n�o tenha, verifico se est� em algum item do contrato
			if !Empty(QRY->PLANO)
				MsgAlert("N�o � poss�vel excluir o produto, pois est� vinculado ao plano do Cemit�rio " + AllTrim(QRY->PLANO) + " filial " + AllTrim(QRY->FILIAL) + ".")
			else
				MsgAlert("N�o � poss�vel excluir o produto, pois est� vinculado ao contrato do Cemit�rio " + AllTrim(QRY->CONTRATO) + " filial " + AllTrim(QRY->FILIAL) + ".")
			endif
			
		endif
		
		// fecho a �rea criada
		If Select("QRY") > 0
			QRY->(DbCloseArea())
		EndIf 
	
	endif

endif

RestArea(aAreaSB1)
RestArea(aArea)

Return(lRet)