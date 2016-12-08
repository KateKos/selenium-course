require './helpers.rb'

describe 'case8' do
	before (:each) do
		@driver = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)	
	end

	it 'checks stickers' do
		sign_in('admin', 'admin')
		@driver.navigate.to 'http://localhost/litecart/en/'
		
		element1 = @driver.find_element(:css, "#box-most-popular > div > ul > li:nth-child(1)")
		sticker1 = element1.find_elements(:css, ".product .sticker").size == 1
		
		element2 = @driver.find_element(:css, "#box-most-popular > div > ul > li:nth-child(2)")
		sticker2 = element2.find_elements(:css, ".product .sticker").size == 1

		element3 = @driver.find_element(:css, "#box-most-popular > div > ul > li:nth-child(3)")
		sticker3 = element3.find_elements(:css, ".product .sticker").size == 1

		element4 = @driver.find_element(:css, "#box-most-popular > div > ul > li:nth-child(4)")
		sticker4 = element4.find_elements(:css, ".product .sticker").size == 1

		element5 = @driver.find_element(:css, "#box-most-popular > div > ul > li:nth-child(5)")
		sticker5 = element5.find_elements(:css, ".product .sticker").size == 1

		element6 = @driver.find_element(:css, "#box-campaigns > div > ul > li")
		sticker6 = element6.find_elements(:css, ".product .sticker").size == 1

		element7 = @driver.find_element(:css, "#box-latest-products > div > ul > li:nth-child(1)")
		sticker7 = element7.find_elements(:css, ".product .sticker").size == 1

		element8 = @driver.find_element(:css, "#box-latest-products > div > ul > li:nth-child(2)")
		sticker8 = element8.find_elements(:css, ".product .sticker").size == 1

		element9 = @driver.find_element(:css, "#box-latest-products > div > ul > li:nth-child(3)")
		sticker9 = element9.find_elements(:css, ".product .sticker").size == 1

		element10 = @driver.find_element(:css, "#box-latest-products > div > ul > li:nth-child(4)")
		sticker10 = element10.find_elements(:css, ".product .sticker").size == 1

		element11 = @driver.find_element(:css, "#box-latest-products > div > ul > li:nth-child(5)")
		sticker11 = element11.find_elements(:css, ".product .sticker").size == 1
		
		stop_browser()
	end
end