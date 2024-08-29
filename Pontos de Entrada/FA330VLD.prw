#INCLUDE "PROTHEUS.CH"

/*/{Protheus.doc} FA330VLD
------------------------------------------------
O ponto de entrada FA330VLD tem como finalidade
possibilitar customiza��o de uma valida��o na
confirma��o dos t�tulos a compensar. Este ponto
de entrada n�o passa nenhum parametro e deve
ter retorno logico (.T. ou .F.) e ser� ativado
ao confirmar no bot�o OK.
------------------------------------------------
@type function
@version 1.0
@author nata.queiroz
@since 13/04/2020
@return lRet, logic
/*/
User Function FA330VLD
    Local lRet := .T.

    If FindFunction("U_UVIND18")
        //-- Valida atualiza��o em t�tulos que est�o em recorr�ncia
        lRet := U_UVIND18(SE1->E1_PREFIXO, SE1->E1_NUM, SE1->E1_PARCELA, SE1->E1_TIPO)
    EndIf

Return lRet