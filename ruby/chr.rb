require 'selenium-webdriver'
require 'pp'

describe 'chrome capabilities' do
	before (:each) do
		#caps = Selenium::WebDriver::Remote::Capabilities.new('unexpectedAlertBehaviour': 'dismiss')
		#@driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
		#puts PP.pp(@driver.capabilities)
		#@driver = Selenium::WebDriver.for(:chrome, args: ["start-fullscreen"])
		@driver = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)	
		@driver.navigate.to 'https://www.google.ru/'
		sleep(10)
		@driver.manage.add_cookie(name: 'test', value: 'testvalue')
		test_cookie = @driver.manage.cookie_named('test')
		cookies = @driver.manage.all_cookies
		@driver.manage.delete_cookie('test')
		@driver.manage.delete_all_cookies
	end

	it 'opens google in chrome' do
		#@driver.navigate.to 'https://www.google.ru/'
		
		print "Press Return to continue..."
  	STDIN.getc
	end
end