<h1 align="center">Desafio WebMotors</h1>

## Instalação e Execução

Para realizar a instalação dos testes automatizados necessita ter o ruby instalado (link para [download](https://rubyinstaller.org/downloads/)).

Também é necessário configurar no PATH do computador o chromedriver (link para [download](https://chromedriver.chromium.org/downloads)), e para finalizar a configuração, no terminal do vscode acessar o diretório do teste e rodar o comando "gem install bundler" e logo em seguida o comando "bundler install" para instalar todas as dependências utilizadas no teste.

Após tudo configurado, para rodar os testes automatizados utilizar o comando "cucumber" para rodar todos os testes, e/ou caso queira rodar os testes isolados utilizar o comando "cucumber -t @NomeDoCenario".

---

## Teste de API 

URL de importação de Collection (Postman) - https://www.getpostman.com/collections/a7a034745210d74d710c

---

## Data

Contém ambientes, css e configurações de acesso.

1. ELM.yml - variáveis ​​com o css / id de cada campo do site.

---

## Data/Reports

Contém o relatório da última execução de teste.

---

## Features/fixtures

Contém os arquivos de cucumber, que serão usados ​​para criar os cenários.

---

## Features/step_definitions

Contém arquivos ruby, que serão usados ​​como "etapas" para cenários criados no cucumber.

---

## Features/support

1. Pages - Contém as classes de rubi que serão utilizadas nos testes.
2. Pages/cores - Contém métodos Capybara / RSPEC, facilitando a automatização.
3. env - Arquivo com as configurações do driver.
4. hooks - Arquivo que faz as parametrizações antes e depois de cada cenário de teste.

---

## Outros

Outros arquivos que estão no projeto, mas estão na pasta principal.

1. gitignore - Responsável por ignorar arquivos desnecessários ao enviar sua versão para o repositório.
2. cucumber.yml - Configurações de perfil de cucumber.
3. Gemfile - Gems usadas no projeto.

---
