require 'selenium-webdriver'

class ProductPage

	def initialize(driver)
    @driver = driver
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  def navigate
    @driver.get 'http://localhost/litecart/en/rubber-ducks-c-1/'
  end

  def find_product(title)
    @driver.find_element(:xpath, "//a[@title = '#{title}']").click
  end

  def set_product_quantity(quantity)
    @driver.find_element(:xpath,"//input[@name = 'quantity']").clear
    @driver.find_element(:xpath,"//input[@name = 'quantity']").send_keys "#{quantity}"
  end

  def submit_product
    @driver.find_element(:xpath, "//button[@name = 'add_cart_product']").click
  end

	def check_cart (total)
  	@driver.manage.timeouts.implicit_wait = 10
  	@driver.find_element(:xpath, "//div[@id = 'cart']")
  	@driver.find_element(:xpath, "//span[text()='#{total}']")
	end

  def back_to_products
    @driver.find_element(:xpath, "//a[contains(@href,'/rubber-ducks-c-1/')]").click
  end

end