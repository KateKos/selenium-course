require 'rspec'
require 'selenium-webdriver'
require 'capybara'

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

def element_present(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
end

def elements_present(how, what)
  return @driver.find_elements(how, what).size > 0
end