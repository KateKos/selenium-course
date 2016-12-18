require './helpers.rb'

describe 'Countries' do
  before (:each) do
    browser_launch()
  end

  it 'opens links in new tabs' do
    sign_in('admin', 'admin')
    @driver.navigate.to 'http://localhost/litecart/admin/?app=countries&doc=countries'
    @driver.find_element(:xpath, "//*[@id='content']/div/a").click

    links = @driver.find_elements(:xpath, "//i[@class = 'fa fa-external-link']") #find all external links

    for link in links
      #byebug
      main_window = @driver.window_handle
      link.click
      @driver.switch_to.window( @driver.window_handles.last ) #Use the newest tab
      @driver.close #Close the window once we're done with that
      @driver.manage.timeouts.implicit_wait = 10
      @driver.switch_to.window( main_window ) #switch to first window       
    end

    stop_browser()
  end
end