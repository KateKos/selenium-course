require './helpers.rb'

describe 'Countries and geozones' do
	before (:each) do
		browser_launch()	
	end

	it 'check countires sorting' do
		sign_in('admin', 'admin')
		@driver.navigate.to 'http://localhost/litecart/admin/?app=countries&doc=countries'
		
		table = @driver.find_element(:xpath, "//table[@class='dataTable']")
    rows = table.find_elements(:xpath, "//tr[@class='row']")
    list = Array.new

    for row in rows
    	country = row.find_element(:xpath, "./td[5]").text
    	list.push("#{country}").sort
		end
    
    print "#{list}"
		stop_browser()
	end
end