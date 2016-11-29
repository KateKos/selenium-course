require './helpers.rb'

describe 'First test' do
	before (:each) do
		@driver = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)	
	end

	it 'login as admin' do
		sign_in('admin', 'admin')
		stop_browser()
	end
end