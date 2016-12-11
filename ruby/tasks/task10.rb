require './helpers.rb'

describe 'Products' do
  before (:each) do
    browser_launch()
  end

  it 'checks correct product' do
    sign_in('admin', 'admin')
    @driver.navigate.to 'http://localhost/litecart/en/'
    
    #checking navigation to correct product page, comparing title and prices
    products = @driver.find_elements(:xpath, "//*[@id='box-campaigns']/div/ul/li/a").first
    product_title = products.attribute("title")
    regular_price = products.find_element(:xpath, "//s[@class='regular-price']").attribute("textContent")
    campaign_price = products.find_element(:xpath, "//strong[@class='campaign-price']").attribute("textContent")

    @driver.find_elements(:xpath, "//*[@id='box-campaigns']/div/ul/li").first.click
    page_header = @driver.find_element(:tag_name, "h1").attribute("textContent")
    regular_inner_price = @driver.find_element(:xpath, "//s[@class='regular-price']").attribute("textContent")
    campaign_inner_price = @driver.find_element(:xpath, "//strong[@class='campaign-price']").attribute("textContent")
    
    if product_title == page_header
      print "Product is correct"
    else
      print "Wrong product!"
    end

    if regular_price == regular_inner_price
      print "Product's regular price is correct"
    else
      print "Product's regular price is wrong"
    end

    if campaign_price == campaign_inner_price
      print "Product's campain price is correct"
    else
      print "Product's campain price is wrong"
    end

    stop_browser()
  end
end