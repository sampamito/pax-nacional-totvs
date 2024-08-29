#Include 'Protheus.ch'
#INCLUDE "topconn.ch"
#INCLUDE "TbiConn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � F040BLQ � Autor � Wellington Gon�alves � Data � 23/08/2016 ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de entrada para validar a exclus�o do t�tulo		  ���
��		     � a receber												  ���
�������������������������������������������������������������������������͹��
���Uso       � Cemit�rio e Funer�ria                                      ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function F040BLQ()

	Local aArea			:= GetArea()
	Local aAreaSE1		:= SE1->(GetArea())
	Local lRet 			:= .T.

	// verifico se o programa esta compilado
	If ExistBlock("UVIND24")
		lRet := U_UVIND24(SE1->(Recno()))
	EndIf

	RestArea(aAreaSE1)
	RestArea(aArea)

Return(lRet)
