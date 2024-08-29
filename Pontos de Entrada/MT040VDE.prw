#Include 'Protheus.ch'
#INCLUDE "topconn.ch"
#INCLUDE "TbiConn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � MT040VDE �Autor � Wellington Gon�alves � Data � 17/08/2016 ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de entrada para validar a exclus�o do vendedor		  ���
�������������������������������������������������������������������������͹��
���Uso       � Cemit�rio e Funer�ria                                      ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function MT040VDE()

Local aArea			:= GetArea()
Local aAreaSA3		:= SA3->(GetArea())
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
		
		cQry := " SELECT " 											+ cPulaLinha
		cQry += " UF2.UF2_FILIAL AS FILIAL, " 						+ cPulaLinha
		cQry += " UF2.UF2_CODIGO AS CONTRATO " 						+ cPulaLinha
		cQry += " FROM " 											+ cPulaLinha
		cQry += " " + RetSqlName("UF2") + " UF2 " 					+ cPulaLinha
		cQry += " WHERE " 											+ cPulaLinha
		cQry += " UF2.D_E_L_E_T_ <> '*' " 							+ cPulaLinha
		cQry += " AND UF2.UF2_VEND = '" + SA3->A3_COD + "' " 		+ cPulaLinha
		cQry += " AND UF2.UF2_FILIAL = '" + SA3->A3_FILIAL + "' " 	+ cPulaLinha
		
		// fun��o que converte a query gen�rica para o protheus
		cQry := ChangeQuery(cQry)
		
		// crio o alias temporario
		TcQuery cQry New Alias "QRY" // Cria uma nova area com o resultado do query   
		
		// se existir contratos da funer�ria vinculados ao cliente
		if QRY->(!Eof()) 
			lRet := .F.
			Help(" ",1,"NODELETA",,"N�o � poss�vel excluir o vendedor, pois est� vinculado ao contrato da Funer�ria " + AllTrim(QRY->CONTRATO) + " filial " + AllTrim(QRY->FILIAL) + ".",2,0)
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
		
		cQry := " SELECT " 											+ cPulaLinha
		cQry += " U00.U00_FILIAL AS FILIAL, " 						+ cPulaLinha
		cQry += " U00.U00_CODIGO AS CONTRATO " 						+ cPulaLinha
		cQry += " FROM " 											+ cPulaLinha
		cQry += " " + RetSqlName("U00") + " U00 " 					+ cPulaLinha
		cQry += " WHERE " 											+ cPulaLinha
		cQry += " U00.D_E_L_E_T_ <> '*' " 							+ cPulaLinha
		cQry += " AND U00.U00_VENDED = '" + SA3->A3_COD + "' " 		+ cPulaLinha	
		cQry += " AND U00.U00_FILIAL = '" + SA3->A3_FILIAL + "' " 	+ cPulaLinha   
		
		// fun��o que converte a query gen�rica para o protheus
		cQry := ChangeQuery(cQry)
		
		// crio o alias temporario
		TcQuery cQry New Alias "QRY" // Cria uma nova area com o resultado do query   
		
		// se existir contratos da funer�ria vinculados ao cliente
		if QRY->(!Eof()) 
			lRet := .F.
			Help(" ",1,"NODELETA",,"N�o � poss�vel excluir o vendedor, pois est� vinculado ao contrato do Cemit�rio " + AllTrim(QRY->CONTRATO) + " filial " + AllTrim(QRY->FILIAL) + ".",2,0)
		endif
		
		// fecho a �rea criada
		If Select("QRY") > 0
			QRY->(DbCloseArea())
		EndIf 
	
	endif
	
endif

RestArea(aAreaSA3)
RestArea(aArea)

Return(lRet)