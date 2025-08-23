#include 'protheus.ch'

/*/{Protheus.doc} MT410TOK
Executado ao clicar no botão OK e pode ser usado 
para validar a confirmação das operações: 
incluir,  alterar, copiar e excluir.
@author TOTVS
@since 28/10/2016
@version P12
@param Nao recebe parametros
@return nulo
/*/

User Function MT410TOK()

	Local aArea	:= GetArea()
	Local lRet	:= .T.

	If ExistBlock("RUTLE105")
		lRet := U_RUTLE105()
	EndIf

Return(lRet)
