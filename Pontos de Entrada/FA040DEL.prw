#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} FA040DEL
Tem como finalidade permitir executar rotinas personalizadas ap�s o termino do processamento de exclus�o do t�tulo,
a partir da op��o 'Excluir' do cadastro de contas a receber.
@author TOTVS
@since 06/11/2018
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function FA040DEL()
	/***********************/

	Local aArea			:= GetArea()
	Local aAreaSE1		:= SE1->(GetArea())

	// verifico se o programa esta compilado
	If ExistBlock("UVIND22")
		U_UVIND22(SE1->(Recno()))
	EndIf

	RestArea(aAreaSE1)
	RestArea(aArea)

Return(Nil)
