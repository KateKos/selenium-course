require 'rspec'
require 'selenium-webdriver'

describe 'First test' do
	before (:each) do
		@driver = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
	
	end
	it 'opens browser' do
		@driver.navigate.to 'https://www.google.ru/'
	end

	after (:each) do
		@driver.quit
	end
end