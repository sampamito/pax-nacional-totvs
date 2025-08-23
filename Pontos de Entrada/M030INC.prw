
#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} M030INC
Ponto de Entrada na inclusao do Cadastro de Clientes
@type function
@version 1.0
@author g.sampaio
@since 01/11/2024
/*/
User Function M030INC()

	// -- verifico se a funcao de alteracao do agendamento existe
	If ExistBlock("RUTIL49O")
		U_RUTIL49O()
	EndIf

Return( Nil )
