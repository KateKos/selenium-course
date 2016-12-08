require './helpers.rb'

describe 'case7' do
	before (:each) do
		@driver = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)	
	end

	it 'goes through admin' do
		sign_in('admin', 'admin')

		#walking through the admin panel menu
		@driver.find_element(:link_text, "Appearence").click
		form1 = element_present(:tag_name, "h1")
		print "#{form1 } "

		@driver.find_element(:link, "Template").click
		form2 = element_present(:tag_name, "h1")
		print "#{form2 } "

		@driver.find_element(:xpath, '//*[@id="doc-logotype"]/a').click
		@driver.find_element(:tag_name, "h1")

		@driver.find_element(:link_text, "Catalog").click
		@driver.find_element(:tag_name, "h1")

		@driver.find_element(:id, "doc-catalog").click
		@driver.find_element(:tag_name, "h1")
		
		@driver.find_element(:xpath, '//a[contains(@href,"?app=catalog&doc=product_groups")]').click
		@driver.find_element(:tag_name, "h1")

		@driver.find_element(:css, "#doc-option_groups > a").click
		@driver.find_element(:tag_name, "h1")
		
		@driver.find_element(:css, "a[href*='?app=catalog&doc=manufacturers']").click
		@driver.find_element(:tag_name, "h1")
		
		@driver.find_element(:link_text, "Suppliers").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Delivery Statuses").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Sold Out Statuses").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Quantity Units").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "CSV Import/Export").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Countries").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Currencies").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Customers").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Customers").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "CSV Import/Export").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Newsletter").click
		@driver.find_element(:tag_name, "h1")		
		@driver.find_element(:link_text, "Geo Zones").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Languages").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Languages").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Storage Encoding").click
		@driver.find_element(:tag_name, "h1")
		
		stop_browser()
	end
end