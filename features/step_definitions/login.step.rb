Dado('que estou na pagina de login') do
   visit ''
   sleep 5
  end
  
  Quando('colocar as credenciais corretas') do
    @test = LoginPage.new
    @test.userLogin
  end
  
  Entao('deve fazer o login com sucesso') do
   
  end