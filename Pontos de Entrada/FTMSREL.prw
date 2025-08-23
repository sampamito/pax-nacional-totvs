#include "protheus.ch"

/*/{Protheus.doc} FTMSREL
Para que se possa utilizar o banco de conhecimentos utilizando uma tabela de usuário ( Ex. SZ1 ) torna-se necessário informar ao sistema qual a 
chave primaria de relacionamento. Por exemplo, a chave primaria de relacionamento do cadastro de clientes  FILIAL+CODIGO+LOJA
@author TOTVS
@since 08/03/2016
@version P12
@param Nao recebe parametros
@return nulo
/*/

/**********************/
User Function FTMSREL()
/**********************/

	Local aEntidade 	:= {}

	If ExistBlock("RUTILE98")
		U_RUTILE98(@aEntidade)
	EndIf
	
Return(aEntidade)
