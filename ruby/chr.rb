require 'selenium-webdriver'
require 'pp'

describe 'chrome capabilities' do
	before (:each) do
#		caps = Selenium::WebDriver::Remote::Capabilities.new('unexpectedAlertBehaviour': 'dismiss')
#		@driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
#		puts PP.pp(@driver.capabilities)
		@driver = Selenium::WebDriver.for(:chrome, args: ["start-fullscreen"])

		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)	
	end

	it 'opens google in chrome' do
		@driver.navigate.to 'https://www.google.ru/'
		
		print "Press Return to continue..."
  	STDIN.getc
	end
end