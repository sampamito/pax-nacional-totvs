#include 'protheus.ch'
#include 'parmtype.ch'

/*/{Protheus.doc} FA040DEL
Tem como finalidade permitir executar rotinas personalizadas após o termino do processamento de exclusão do título,
a partir da opção 'Excluir' do cadastro de contas a receber.
@author TOTVS
@since 06/11/2018
@version P12
@param Nao recebe parametros
@return nulo
/*/

/***********************/
User Function FA040DEL()
	/***********************/

	Local aArea		:= GetArea()
	Local aAreaSE1	:= SE1->(GetArea())
	Local cChave	:= SE1->(E1_FILIAL+E1_PREFIXO+E1_NUM+E1_PARCELA+E1_TIPO) //Chave do titulo a ser integrado

	// verifico se o programa esta compilado
	If ExistBlock("UVIND22")
		U_UVIND22(SE1->(Recno()))
	EndIf

	//DTGD-51 boleto integrado com o Hub Bancário (total bank)
	If !Empty(SE1->E1_IDCNAB) .AND. ExistBlock("RUTIL115")
		U_RUTIL115(cChave,3)
	EndIf

	RestArea(aAreaSE1)
	RestArea(aArea)

Return(Nil)
