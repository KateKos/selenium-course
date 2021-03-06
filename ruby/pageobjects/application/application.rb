require 'selenium-webdriver'
require './pageobjects/pages/checkout_page.rb'
require './pageobjects/pages/product_page.rb'
require './pageobjects/pages/site_homepage.rb'

class Application

  attr_reader :product_page, :checkout_page
	
	def initialize
    @driver = Selenium::WebDriver.for :chrome
    @homepage = LitecartHomepage.new @driver
    @product_page = ProductPage.new @driver
    @checkout_page = CheckoutPage.new @driver
  end

  def add_product_into_cart (product_spec)
    @product_page.navigate
    @product_page.find_product(product_spec[:name])
    @product_page.set_product_quantity(product_spec[:qty])
    @product_page.submit_product
    sleep(0.5)
  end

  def open_cart
    @checkout_page.open_checkout
  end
  
  def clear_cart
    @checkout_page.navigate
    @checkout_page.clear_cart
  end

	def table_update (amount)
  	i = 0
    while i < amount
    	table = @checkout_page.find_products_table
    	@checkout_page.remove_product_from_checkout
    	@checkout_page.table_wait(table)
    	@checkout_page.browser_refresh
      i+=1
    end
	end

	def cart_update
		@checkout_page.empty_cart?
	end

  def stop_browser()
  	print "Press Return to continue..."
  	STDIN.getc
	end

end