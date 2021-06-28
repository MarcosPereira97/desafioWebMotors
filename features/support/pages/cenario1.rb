class WebmotorsTest < Metodos
  include Capybara::DSL

  def visitaSite(site)
    acessaSite(site)
  end

  def pesquisaMarca(marca)
    within(:xpath, "//*[@id='WhiteBox']") do
      preencheCampos("barraPesquisa", marca)
      clicaElemento("selecionaMarca")
    end
  end

  def selecionaModelo(modelo)
    clicaElemento("opcModelos")
    preencheCampos("pesquisaModelo", modelo)
    clicaElemento("selecionaModelo")
  end

  def selecionaVersao(versao)
    clicaElemento("opcVersao")
    preencheCampos("pesquisaVersao", versao)
    clicaElemento("selecionaVersao")
  end

  def abreAnuncio
    assert_selector(EL["aguardaAnuncio"])
    clicaElemento("anuncioCarro")
  end

  def mantemNovaAba
    within_window(switch_to_window(windows.last))
    click_button "Entendi"
  end

  def acessaEstoque
    self.mantemNovaAba
    clicaElemento("linkEstoque")
  end

  def validaInformacoes(marca, modelo, versao)
    self.mantemNovaAba
    valida_texto_na_pagina(marca)
    valida_texto_na_pagina(modelo)
    valida_texto_na_pagina(versao)
  end

  def validaEstoque
    valida_texto_na_pagina("carros encontrados")
  end
end
