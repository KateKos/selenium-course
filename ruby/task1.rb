require 'rspec'
require 'selenium-webdriver'

describe 'First test' do
	before (:each) do
		@driver = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)	
	end

	it 'login as admin' do
		@driver.navigate.to 'http://localhost/litecart/admin/login.php'
		@driver.find_element(:name, 'username').send_keys 'admin'
		@driver.find_element(:name, 'password').send_keys 'admin'
		@driver.find_element(:name, 'remember_me').click
		@driver.find_element(:name, 'login').click
		print "Press Return to continue..."
  	STDIN.getc
	end
end