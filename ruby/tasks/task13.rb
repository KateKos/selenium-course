require './helpers.rb'

describe 'Shopping cart' do
  before (:each) do
    browser_launch()
  end

  it 'addes products into shopping cart' do
    @driver.navigate.to 'http://localhost/litecart/en/rubber-ducks-c-1/'

    #adding first element
    first_product = @driver.find_element(:xpath, "//a[@title = 'Purple Duck']").click
    @driver.find_element(:xpath,"//input[@name = 'quantity']").clear
    @driver.find_element(:xpath,"//input[@name = 'quantity']").send_keys "2"
    @driver.find_element(:xpath, "//button[@name = 'add_cart_product']").click

    #wait and check that first element was added into cart
    @driver.manage.timeouts.implicit_wait = 20
    @driver.find_element(:xpath, "//div[@id = 'cart']")
    @driver.find_element(:xpath, "//span[text()='2']")
    @driver.find_element(:xpath, "//a[contains(@href,'/rubber-ducks-c-1/')]").click

    #adding second element
    second_product = @driver.find_element(:xpath, "//a[@title = 'Blue Duck']").click
    @driver.find_element(:xpath,"//input[@name = 'quantity']").clear
    @driver.find_element(:xpath,"//input[@name = 'quantity']").send_keys "3"
    @driver.find_element(:xpath, "//button[@name = 'add_cart_product']").click

    #wait and check that second element was added into cart
    @driver.manage.timeouts.implicit_wait = 20
    @driver.find_element(:xpath, "//div[@id = 'cart']")
    @driver.find_element(:xpath, "//span[text()='5']")
    @driver.find_element(:xpath, "//a[contains(@href,'/rubber-ducks-c-1/')]").click

    #adding third element
    third_product = @driver.find_element(:xpath, "//a[@title = 'Green Duck']").click
    @driver.find_element(:xpath, "//button[@name = 'add_cart_product']").click

    #wait and check that third element was added into cart
    @driver.manage.timeouts.implicit_wait = 20
    @driver.find_element(:xpath, "//div[@id = 'cart']")
    @driver.find_element(:xpath, "//span[text()='6']")
    
    #check out page
    @driver.find_element(:xpath, "//a[contains(@href,'/checkout')]").click
    
    products_amount = 3
    i = 0

    while i < products_amount
      table = @driver.find_element(:xpath, "//table[@class ='dataTable rounded-corners']")
      @driver.find_element(:xpath, "//button[@name = 'remove_cart_item']").click
      @wait.until{ staleness_of(table) }
      @driver.navigate.refresh
      i+=1
    end
 
    text = @driver.find_element(:xpath, "//em[text()='There are no items in your cart.']").text
    
    if text == ('There are no items in your cart.')
      puts "Shopping cart is empty"
    else
      puts "Something went wrong"
    end

    stop_browser()
  end
end