Dado('que estou logado como {string} e {string}') do |email, senha|
  visit "/"
  find("input[placeholder='Seu e-email']").set email
  find("input[type=password]").set senha

  click_button "Entrar"
end

Dado('acesso o formulário de cadastro de anúncios') do
  click_button "Criar anúncio"
  #checkpoint para garantir que estou no lugar correto
  expect(page).to have_css "#equipoForm"
end


Dado('que eu tenho o seguinte equipamento:') do |table|
  @anuncio = table.rows_hash
  log @anuncio
end

Quando('submeto o cadastro desse item') do

  thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

  find("#thumbnail input[type=file]", visible: false).set thumb
  find("input[placeholder$=equipamento]").set @anuncio[:nome]
  find("#category").find('option', text: @anuncio[:categoria]).select_option
  find("input[placeholder^=Valor]").set @anuncio[:preco]

  #click_button "Cadastrar"

  sleep 10
end

Então('devo ver esse item no meu Dashboard') do
  pending # Write code here that turns the phrase above into concrete actions
end
