#include 'protheus.ch'

/*/{Protheus.doc} MT410TOK
Executado ao clicar no bot�o OK e pode ser usado para validar a confirma��o das opera��es: incluir,  alterar, copiar e excluir.
@author TOTVS
@since 28/10/2016
@version P12
@param Nao recebe parametros
@return nulo
/*/

/**********************/
User Function MT410TOK()
/**********************/

	Local lRet			:= .T.
	Local aArea 		:= GetArea()

	Local lFuneraria	:= SuperGetMV("MV_XFUNE",,.F.)
	Local lCemiterio	:= SuperGetMV("MV_XCEMI",,.F.)
	Local lC5_XCLASSI	:= SuperGetMV("MV_XVALCLA",,.F.)
	Local lValDocSaid	:= SuperGetMV("MV_XVALDOC",,.F.)

	If lFuneraria .And. lC5_XCLASSI

		If Empty(M->C5_XCLASSI)
			MsgInfo("Campo Classifica��o obrigat�rio.","Aten��o")
			lRet := .F.
		Endif

	Endif

	If lCemiterio .And. lValDocSaid

		If !Empty(SC5->C5_NOTA)
			lRet := .F.
			MsgAlert("N�o � poss�vel realizar alteracao no pedido de vendas, pois j� existe documento de saida gerado!", "Pedido Faturado")
		EndIf

	EndIf

	RestArea(aArea)

Return(lRet)
