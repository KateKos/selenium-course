require 'rspec/expectations'
require './pageobjects/specs/shared_setup.rb'

describe 'Litecart' do 
	
	it 'add and remove products' do 
		@app.open_catalog
		@app.add_product_into_cart 
		@app.open_cart
		@app.table_update(1)
		@app.cart_update
		@app.stop_browser
	end 
end