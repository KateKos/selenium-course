require './helpers.rb'

describe 'Products' do
	before (:each) do
		browser_launch()
	end

	it 'checks correct product' do
		sign_in('admin', 'admin')
    @driver.navigate.to 'http://localhost/litecart/en/'
    
    #checking navigation to correct product page
    element_text = @driver.find_elements(:xpath, "//*[@id='box-campaigns']/div/ul/li/a").first.attribute("title")
    @driver.find_elements(:xpath, "//*[@id='box-campaigns']/div/ul/li").first.click
    page_header = @driver.find_element(:tag_name, "h1").attribute("textContent")
    
    if element_text == page_header
      print "Product is correct"
    else
      print "Wrong product!"
    end

		stop_browser()
	end
end