#language: pt
@regressao
Funcionalidade: Validar os campos de busca de "Marca", "Modelo" e "Versão" da página de resultado de busca da Webmotors

    Contexto: Acessar site
        Dado que acesso ao site da "Webmotors"

    @teste1
    Esquema do Cenário: Pesquisa por carro
        Dado que realizo a pesquisa de uma <marca> 
        E seleciono um <modelo> 
        Quando seleciono a <versao> 
        E acesso o anuncio do veículo
        Então valido as informações <marca>, <modelo> e <versao>

        Exemplos:  
            | marca    | modelo    | versao     |
            | "Toyota" | "Corolla" | "XRS"      |
            | "Honda"  | "Civic"   | "Turbo"    |
            | "Ford"   | "Fusion"  | "Titanium" |

    @teste2
    Esquema do Cenário: Listagem de estoque de uma determinada loja
        Dado que realizo a pesquisa de uma <marca> 
        E seleciono um <modelo> 
        Quando acesso o anuncio do veículo
        E acesso o estoque da loja
        Então valido a quantidade de carros em estoque

        Exemplos:  
            | marca | modelo |
            | "BMW" | "218i" |