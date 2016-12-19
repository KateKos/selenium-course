require 'rspec'
require 'selenium-webdriver'
require 'byebug'
require 'faker'
require 'logger'

def sign_in (login, password)
		@driver.navigate.to 'http://localhost/litecart/admin/login.php'
		@driver.find_element(:name, 'username').send_keys login
		@driver.find_element(:name, 'password'). send_keys password
		@driver.find_element(:name, 'remember_me').click
		@driver.find_element(:name, 'login').click
end

def browser_launch()
  @driver = Selenium::WebDriver.for :chrome
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10) 
end

def browser_launch_listener()
  @driver = Selenium::WebDriver.for(:chrome, :listener => MyListener.new(Logger.new(STDOUT)))
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10) 
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

def back
  @bridge.goBack
end

def staleness_of(element)
 element.enabled?
 false
rescue Selenium::WebDriver::Error::ObsoleteElementError
 true
end

def window_opened_full(old_windows, new_windows)
  old_windows < new_windows
    true
  rescue Selenium::WebDriver::Error::NoSuchWindowError
    false
end