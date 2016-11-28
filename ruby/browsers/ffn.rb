require 'rspec'
require 'selenium-webdriver'
require 'pp'

describe 'run firefox nightly' do
	before (:each) do
		
		#caps = Selenium::WebDriver::Remote::W3CCapabilities.new()
		Selenium::WebDriver::Firefox::Binary.path = "./Applications/FirefoxNightly.app"
		@driver = Selenium::WebDriver.for :firefox
		#@driver = Selenium::WebDriver.for(:firefox, :desired_capabilities => caps)
		#puts PP.pp(@driver.capabilities)
		@wait = Selenium::WebDriver::Wait.new(:timeout => 5)	
	end

	it 'login as admin' do
		@driver.navigate.to 'http://localhost/litecart/admin/login.php'
		@driver.find_element(:name, 'username').send_keys 'admin'
		@driver.find_element(:name, 'password').send_keys 'admin'
		@driver.find_element(:name, 'remember_me').click
		@driver.find_element(:name, 'login').click
		print "Press Return to continue..."
  	STDIN.getc
		#@driver.quit()
	end
end