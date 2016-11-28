require 'rspec'
require 'selenium-webdriver'

describe 'case7' do
	before (:each) do
		@driver = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10)	
	end

	it 'goes through admin' do
		@driver.navigate.to 'http://localhost/litecart/admin/login.php'
		@driver.find_element(:name, 'username').send_keys 'admin'
		@driver.find_element(:name, 'password').send_keys 'admin'
		@driver.find_element(:name, 'remember_me').click
		@driver.find_element(:name, 'login').click

		#walking through the admin panel menu
		@driver.find_element(:link_text, "Appearence").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Template").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Logotype").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Catalog").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Catalog").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Product Groups").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Option Groups").click
		@driver.find_element(:tag_name, "h1")
		@driver.find_element(:link_text, "Manufacturers").click
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
		
		print "Press Return to continue..."
  	STDIN.getc
	end
end