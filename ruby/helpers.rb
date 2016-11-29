require 'rspec'
require 'selenium-webdriver'

def sign_in (login, password)
		@driver.navigate.to 'http://localhost/litecart/admin/login.php'
		@driver.find_element(:name, 'username').send_keys login
		@driver.find_element(:name, 'password'). send_keys password
		@driver.find_element(:name, 'remember_me').click
		@driver.find_element(:name, 'login').click
end

def stop_browser()
  print "Press Return to continue..."
  STDIN.getc
end