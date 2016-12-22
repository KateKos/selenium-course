require 'selenium-webdriver'
require './pageobjects/pages/checkout_page.rb'
require './pageobjects/pages/product_page.rb'
require './pageobjects/pages/site_homepage.rb'

class Application
	
	def initialize
    @driver = Selenium::WebDriver.for :chrome
    @homepage = LitecartHomepage.new @driver
    @product_page = ProductPage.new @driver
    @checkout_page = CheckoutPage.new @driver
  end

  def open_catalog
  	@homepage.open_products
  end

	def add_product_into_cart 
		@product_page.find_product("Red Duck")
		@product_page.set_product_quantity("2")
		@product_page.submit_product
		@product_page.check_cart("2")
		@product_page.back_to_products
	end

  def open_cart
    @homepage.open_checkout
  end

	def table_update (amount)
		products_amount = amount
  	i = 0
    while i < products_amount
    	table = @checkout_page.find_products_table
    	@checkout_page.remove_product_from_checkout
    	@checkout_page.table_wait(table)
    	@checkout_page.browser_refresh
      i+=1
    end
	end

	def cart_update
		@checkout_page.empty_cart
	end

  def stop_browser()
  	print "Press Return to continue..."
  	STDIN.getc
	end

end