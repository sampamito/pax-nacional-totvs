#include 'protheus.ch'

/*/{Protheus.doc} M030EXC
Executado ap�s o usu�rio confirmar a exclus�o; Depois da execu��o do mesmo, ser� feita a exclus�o efetiva dos dados 
do Cliente no arquivo.
@author TOTVS
@since 20/09/2018
@version P12
@param Nao recebe parametros
@return nulo
/*/

/**********************/
User Function M030EXC()
/**********************/

Local aArea	:= GetArea()
	
RestArea(aArea)

Return
