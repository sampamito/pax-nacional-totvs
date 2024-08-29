#INCLUDE "TOTVS.CH"
 
/*/{Protheus.doc} F200VAR
    O ponto de entradaFA200_02 � executado ap�s a grava��o dos dados
    de um t�tulo que teve a entrada confirmada (ocorr�ncia = 02).
    @type function
    @author Lorran Ferreira
    @since 13/08/2024
/*/
User Function FA200_02()
    
    Local aArea      := FwGetArea()
    Local aAreaSE1   := SE1->(FwGetArea())

    // Gera registro na tabela F71 para o banco Sicredi
    If ExistBlock("RUTILE88")
        U_RUTILE88()
    EndIf
    
    FwRestArea(aAreaSE1)
    FwRestArea(aArea)
 
Return()
