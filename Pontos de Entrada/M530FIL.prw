#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

#DEFINE CRLF CHR(13)+CHR(10)

/*/{Protheus.doc} M530AGL
O ponto de entrada M530FIL existe na função fa530Processa "Atualização do Pagamento de Comissões (MATA530)" 
e será disparado para filtrar os vendedores conforme os parâmetros dos clientes.

Esta sendo utilizado para filtrar as comissões cujos os títulos já tenham sido recebidos (baixados).

@author pablocavalcante
@since 21/06/2016
@version undefined

@type function
/*/

User Function M530FIL()
	Local cRet := IIF(ExistBlock("RUTLE101"),"U_RUTLE101()",".T.")
Return(cRet)
