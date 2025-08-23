#include 'protheus.ch'

/*/{Protheus.doc} M410STTS
Executado após todas as alterações no arquivo de pedidos terem sido feitas.
@author TOTVS
@since 21/07/2016
@version P11
@param Nao recebe parametros
@return nulo
/*/
User Function M410STTS()

	If ExistBlock("RFUNE071")
		U_RFUNE071(SC5->(Recno()))
	EndIf

Return(Nil)
