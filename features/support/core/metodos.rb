class Metodos
  include Capybara::DSL
  include RSpec::Matchers

  ### Métodos ###

  def acessaSite(elm)
    visit(EL[elm])
  rescue StandardError => e
    raise "Nao foi possivel acessar o site #{elm}"
  end

  def clicaElemento(elm)
    first(:xpath, EL[elm]).click
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  def preencheCampos(elm, valor)
    first(:xpath, EL[elm]).set valor
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  ### Validadores ###

  def valida_elemento_na_pagina(elm)
    expect(page).to have_content elm
  rescue StandardError => e
    raise "Nao foi possivel encontrar o elemento #{elm}"
  end

  def valida_texto_na_pagina(texto)
    expect(page).to have_text texto
  rescue StandardError => e
    raise "Nao foi possivel encontrar a mensagem #{texto}"
  end
end
