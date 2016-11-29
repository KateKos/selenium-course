require 'rspec'
require 'selenium-webdriver'
require 'pp'

describe 'run firefox nightly' do
	before (:each) do
		Selenium::WebDriver::Firefox::Binary.path = "/Applications/FirefoxNightly.app/Contents/MacOS/firefox-bin"
		@driver = Selenium::WebDriver.for :firefox
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
		#@driver.quit()
	end
end