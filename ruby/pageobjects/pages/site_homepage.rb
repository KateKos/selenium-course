require 'selenium-webdriver'

class LitecartHomepage
	
	def initialize(driver)
    @driver = driver
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  end

  def open_products
    @driver.get 'http://localhost/litecart/en/rubber-ducks-c-1/'
    self
  end

end