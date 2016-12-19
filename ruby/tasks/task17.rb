require './helpers.rb'

describe 'Browser' do
  before (:each) do
    browser_launch()
  end

  it 'opens catalog and checks logs' do
    sign_in('admin', 'admin')
    @driver.navigate.to 'http://localhost/litecart/admin/?app=catalog&doc=catalog&category_id=1'
    
    table = @driver.find_element(:xpath, "//table[@class='dataTable']")
    n = table.find_elements(:xpath, ".//tr[@class='row']").size
    
    i = 3 #excluding categories and subcategories

    while i < n
      #byebug
      table = @driver.find_element(:xpath, "//table[@class='dataTable']")
      rows = table.find_elements(:xpath, ".//tr[@class='row']")[i]
      rows.find_element(:xpath, ".//a[@title='Edit']").click
      
      @driver.manage.logs.get('browser').each do |l|
        puts l
      end
     
      @driver.navigate.back
      i+=1
    end

    stop_browser()
  end
end