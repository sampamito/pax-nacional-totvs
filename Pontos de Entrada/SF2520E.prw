#include "totvs.ch"

/*/{Protheus.doc} SF2520E
Ponto de Entrada na Exclusao de Notas Fiscais de Saida
@type function
@version 1.0
@author g.sampaio
@since 07/11/2024
/*/
User Function SF2520E()

    Local aArea     := GetArea()

    If Existblock("RUTLE107")
        U_RUTLE107(SF2->(Recno()))
    EndIf

    RestArea(aArea)

Return(Nil)
