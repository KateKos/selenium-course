require 'rspec/expectations'
require './pageobjects/specs/shared_setup.rb'
require './pageobjects/specs/shared_setup.rb'

describe 'Litecart' do 
	
	it 'add and remove products should work' do 

		@app.clear_cart

		products = [{name: "Red Duck", qty: 2}, 
		            {name: "Green Duck", qty: 1}, 
		            {name: "Purple Duck", qty: 3}]

		sum = 0
		products.each{|p|
			@app.add_product_into_cart(p)
			sum=sum + p[:qty]
			@app.product_page.check_cart(sum)
		}
		
		@app.open_cart
		@app.table_update(3)
		@app.cart_update
		@app.stop_browser
	end 
end