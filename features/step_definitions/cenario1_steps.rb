Dado("que acesso ao site da {string}") do |site|
  @test.visitaSite(site)
end

Quando("que realizo a pesquisa de uma {string}") do |marca|
  @test.pesquisaMarca(marca)
end

Dado("seleciono um {string}") do |modelo|
  @test.selecionaModelo(modelo)
end

Quando("seleciono a {string}") do |versao|
  @test.selecionaVersao(versao)
end

Quando("acesso o anuncio do veículo") do
  @test.abreAnuncio
end

Então("valido as informações {string}, {string} e {string}") do |marca, modelo, versao|
  @test.validaInformacoes(marca, modelo, versao)
end

Quando("acesso o estoque da loja") do
  @test.acessaEstoque
end

Então("valido a quantidade de carros em estoque") do
  @test.validaEstoque
end
