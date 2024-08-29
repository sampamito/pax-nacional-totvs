#Include 'Protheus.ch'
#INCLUDE "topconn.ch"
#INCLUDE "TbiConn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � MT410ACE �Autor � Wellington Gon�alves � Data � 23/08/2016 ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de entrada para validar a exclus�o do pedido de venda���
�������������������������������������������������������������������������͹��
���Uso       � Cemit�rio e Funer�ria                                      ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function MT410ACE()

Local aArea			:= GetArea()
Local aAreaSC5		:= SC5->(GetArea())
Local lRet 			:= .T.
Local lFuneraria	:= SuperGetMV("MV_XFUNE",,.F.)
Local lCemiterio	:= SuperGetMV("MV_XCEMI",,.F.)
Local nOpc  		:= PARAMIXB[1]

if !IsBlind() // n�o ser� validado em rotinas automaticas

	if nOpc == 1 // se a opera��o for exclus�o
	
		if lFuneraria // verifico se este pedido de venda � de um contrato da funer�ria
		
			if !Empty(SC5->C5_XAPTOFU)
				lRet := .F.
				MsgAlert("N�o � poss�vel excluir o pedido de venda, pois est� vinculado ao Apontamento de Servi�o " + AllTrim(SC5->C5_XCTRFUN) + ".")
			endif
		
		endif
		
		if lRet .AND. lCemiterio // verifico se este pedido de venda � de um contrato do cemit�rio
			if !Empty(SC5->C5_XCONTRA) .And. !IsInCallStack("U_RCPGA001")
				lRet := .F.
				MsgAlert("N�o � poss�vel excluir o pedido de venda, pois est� vinculado ao contrato do Cemit�rio " + AllTrim(SC5->C5_XCONTRA) + ".")
			endif
		
		endif 
	
	endif

endif

RestArea(aAreaSC5)
RestArea(aArea)

Return(lRet)