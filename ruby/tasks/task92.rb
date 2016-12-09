require './helpers.rb'

describe 'Countries and geozones' do
	before (:each) do
		browser_launch()
	end

	it 'check countires sorting' do
		sign_in('admin', 'admin')
		@driver.navigate.to 'http://localhost/litecart/admin/?app=geo_zones&doc=geo_zones'

		table = @driver.find_element(:xpath, "//table[@class='dataTable']")
    n = table.find_elements(:xpath, "//tr[@class='row']").size
    
    i = 0

    while i < n
   		#byebug
   		table = @driver.find_element(:xpath, "//table[@class='dataTable']")
   		rows = table.find_elements(:xpath, "//tr[@class='row']")[i]
   		rows.find_element(:xpath, ".//a[@title='Edit']").click
    	
    	tablezones = @driver.find_element(:xpath, "//table[@id='table-zones']")
    	rowszones = tablezones.find_elements(:css, "#table-zones tr:not(.header)")[0...-1]

			list = Array.new

    	for rowszone in rowszones
          zone = rowszone.find_element(:xpath, "./td[3]/select")
          select_list = Selenium::WebDriver::Support::Select.new(zone)
          selected_option = select_list.selected_options[0].text
          list.push("#{selected_option}").sort
    	end

    	print "#{list}"
    	@driver.navigate.back
    	i+=1
    end

		stop_browser()
	end
end