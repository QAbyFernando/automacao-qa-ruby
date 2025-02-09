class LoginPage < SitePrism::Page
    element :acessarButton, :xpath, '//*[@id="gnav-main-container"]/div/div/div[2]/div[2]/div[3]/div/a'
    element :loginGoogle, :xpath, '//*[@id="login-google-button"]'
    element :emailField, :xpath, '//*[@id="identifierId"]'
    element :nextButton, :xpath, '//*[@id="identifierNext"]/div/button'
    element :senhaField, :xpath, '//*[@id="password"]/div[1]/div/div[1]/input'
  
    def userLogin
      acessarButton.click # Clica para abrir o modal de login
      loginGoogle.click   # Clica no botão "Entrar com Google"
  
      # Troca para a janela/modal do Google se necessário
      switch_to_google_window
  
      # Espera o campo de e-mail ficar visível
      wait_until_emailField_visible
      emailField.set "dev.fernando.js@gmail.com" # Insere o e-mail
  
      # Espera o botão "Próxima" ficar visível e clica
      wait_until_nextButton_visible
      nextButton.click

      wait_until_senhaField_visible
      senhaField.set "202826Luis@"
    end
  
    private
  
    # Método para alternar para a nova janela/modal
    def switch_to_google_window
      google_window = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.window(google_window)
    end
  end
  
  