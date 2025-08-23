#include 'protheus.ch'
#include 'parmtype.ch'

#DEFINE CRLF CHR(13)+CHR(10)

/*/{Protheus.doc} FA070CAN
O ponto de entrada FA070CAN sera executado apos
gravacao dos dados de cancelamento no SE1
e antes de estornar os dados do SE5 e de comissao.

@type function
@author Pablo Cavalcante
@since 19/05/2016
@version 1.1
@history 08/04/2020 - Marcos Nata
/*/
User Function FA070CAN()

	// -- veerifico se o programa esta compilado
	If ExistBlock("RUTILE95")
		U_RUTILE95(SE1->(Recno()))
	EndIf 

Return(Nil)
