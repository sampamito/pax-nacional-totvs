#Include 'Protheus.ch'
#INCLUDE "topconn.ch"
#INCLUDE "TbiConn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � FA070CA2 �Autor � Wellington Gon�alves � Data � 21/12/2016 ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de entrada executado ap�s a conclus�o do cancelamento���
��		     � da baixa dos t�tulos a receber.							  ���
��		     � Est� sendo utilizado para voltar o contrato da funer�ria   ���
��			 � para Status A=Ativo, caso esteja finalizado..				  ���
�������������������������������������������������������������������������͹��
���Uso       � Cemit�rio e Funer�ria                                      ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function FA070CA2()
/*
Local aArea			:= GetArea()
Local aAreaUF2		:= {}
Local lFuneraria	:= SuperGetMV("MV_XFUNE",,.F.)
Local lCemiterio	:= SuperGetMV("MV_XCEMI",,.F.)
Local nOpc  		:= PARAMIXB[1] // 5=Cancelamento da baixa ; 6=Exclusao da baixa

if lFuneraria
	
	aAreaUF2 := UF2->(GetArea())
	
	// posiciono no conrato
	UF2->(DbSetOrder(1)) // UF2_FILIAL + UF2_CODIGO
	
	if UF2->(DbSeek(xFilial("UF2") + SE1->E1_XCTRFUN))
		
		// se o contrato estava com status de F=FINALIZADO
		// e est� sendo excluido um apontamento
		if UF2->UF2_STATUS == "F"
	
			// volto seu status para A=ATIVO
			if RecLock("UF2",.F.)
				UF2->UF2_STATUS := "A"
				UF2->(MsUnlock())
				MsgInfo("Este contrato foi retornado para o Status Ativo!","Finaliza��o de Contrato")
			endif
			
		endif
		
	endif
	
	RestArea(aAreaUF2)
		
endif

RestArea(aArea)
*/
Return(Nil)
