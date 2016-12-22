require 'selenium-webdriver'

class CheckoutPage

  def initialize(driver)
    @driver = driver
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  def navigate
    @driver.get 'http://localhost/litecart/en/checkout'
  end
  
  def staleness_of(element)
    element.enabled?
    false
  rescue Selenium::WebDriver::Error::ObsoleteElementError
    true
  end

	def open_checkout
    @driver.find_element(:xpath, "//a[contains(@href,'/checkout')]").click 
  end

  def find_products_table
    @driver.find_element(:xpath, "//table[@class ='dataTable rounded-corners']")
  end

  def remove_product_from_checkout
    @driver.find_element(:xpath, "//button[@name = 'remove_cart_item']").click
  end

  def table_wait(table)
    @wait.until{staleness_of(table)}
  end

  def browser_refresh
    @driver.navigate.refresh
  end

  def clear_cart
    while not empty_cart? do
      table = nil
      begin
        table = find_products_table
      rescue Selenium::WebDriver::Error::NoSuchElementError
        return
      end
      remove_product_from_checkout
      table_wait(table)
    end
  end

  def empty_cart?
    text = @driver.find_element(:xpath, "//em[text()='There are no items in your cart.']").text

    if text == ('There are no items in your cart.')
        puts "Shopping cart is empty"
      else
        puts "Something went wrong"
      end
    
  end
end