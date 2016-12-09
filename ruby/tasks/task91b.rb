require './helpers.rb'

describe 'Countries and geozones' do
	before (:each) do
		@driver = Selenium::WebDriver.for :chrome
		@wait = Selenium::WebDriver::Wait.new(:timeout => 20)	
	end

	it 'check countires sorting' do
		sign_in('admin', 'admin')
		@driver.navigate.to 'http://localhost/litecart/admin/?app=countries&doc=countries'

		table = @driver.find_element(:xpath, "//table[@class='dataTable']")
    n = table.find_elements(:xpath, "//tr[@class='row'][./td[6][not(contains(text(),'0'))]]").size
    
    i = 0

    while i < n
   		#byebug
   		table = @driver.find_element(:xpath, "//table[@class='dataTable']")
   		rows = table.find_elements(:xpath, "//tr[@class='row'][./td[6][not(contains(text(),'0'))]]")[i]
   		rows.find_element(:xpath, ".//a[@title='Edit']").click
    	
    	tablezones = @driver.find_element(:xpath, "//table[@id='table-zones']")
    	rowszones = tablezones.find_elements(:css, "#table-zones tr:not(.header)")[0...-1]

			list = Array.new

    	for rowszone in rowszones
    		zone = rowszone.find_element(:xpath, "./td[3]").text
    		list.push("#{zone}").sort
    	end

    	print "#{list}"
    	@driver.navigate.back
    	i+=1
    end

		stop_browser()
	end
end