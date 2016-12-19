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

    list1 = Array.new
    list2 = Array.new

    for link in links
      #byebug
      main_window = @driver.window_handle
      old_windows = @driver.window_handles
      link.click
      new_windows = @driver.window_handles
      list1 = old_windows.size
      list2 = new_windows.size
      @wait.until { window_opened_full(list1, list2) } #wait until new window will be fully opened
      @driver.switch_to.window( @driver.window_handles.last ) #use the newest tab
      @driver.close #close the window once we're done with that
      @driver.switch_to.window( main_window ) #switch to main window       
    end

    stop_browser()
  end
end