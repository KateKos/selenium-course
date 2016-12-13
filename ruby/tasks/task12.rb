require './helpers.rb'

describe 'New product' do
  before (:each) do
    browser_launch()
  end

  it 'addes new product in litecartadmin' do
    sign_in('admin', 'admin')
    @driver.find_element(:link_text, "Catalog").click
    @driver.find_element(:xpath, "//a[contains(@href,'?category_id=0&app=catalog&doc=edit_product')]").click

    #fill info at general tab
    @driver.find_element(:xpath,"//input[@name = 'status']").click
    product_name = Faker::Superhero.name
    @driver.find_element(:xpath, "//input[@name = 'name[en]']").send_keys "#{product_name}"
    @driver.find_element(:xpath, "//input[@name = 'code']").send_keys "#{Faker::Vehicle.vin}"
    @driver.find_element(:xpath,"//input[@name = 'categories[]'][@value = '1']").click
    @driver.find_element(:xpath,"//input[@name = 'product_groups[]'][@value = '1-2']").click
    @driver.find_element(:xpath,"//input[@name = 'quantity']").clear
    @driver.find_element(:xpath,"//input[@name = 'quantity']").send_keys "50.00"
    
    sold_out = @driver.find_element(:xpath, "//select[@name = 'sold_out_status_id']")
    select_list1 = Selenium::WebDriver::Support::Select.new(sold_out)
    select_list1.select_by(:text, '-- Select --')

    @driver.find_element(:xpath,"//input[@name = 'new_images[]']").send_keys "/Users/KateKos/Desktop/pics/carrot_PNG4997.png"
    @driver.find_element(:xpath,"//input[@name = 'date_valid_from']").send_keys(:home, '14 12 2016')
    @driver.find_element(:xpath,"//input[@name = 'date_valid_to']").send_keys(:home, '14 12 2017')

    @driver.find_element(:xpath, "//a[contains(@href,'#tab-information')]").click

    #fill info at information tab
    manufacturer = @driver.find_element(:xpath, "//select[@name = 'manufacturer_id']")
    select_list2 = Selenium::WebDriver::Support::Select.new(manufacturer)
    select_list2.select_by(:value, '1')

    @driver.find_element(:xpath, "//input[@name = 'keywords']").send_keys "#{Faker::Lorem.words}"
    @driver.find_element(:xpath, "//input[@name = 'short_description[en]']").send_keys "#{Faker::Lorem.sentence}"
    @driver.find_element(:xpath, "//div[@class = 'trumbowyg-editor']").send_keys "Faker::Lorem.paragraph"
    @driver.find_element(:xpath, "//input[@name = 'head_title[en]']").send_keys "Some Head Title"
    @driver.find_element(:xpath, "//input[@name = 'meta_description[en]']").send_keys "Some Meta Description"

    @driver.find_element(:xpath, "//a[contains(@href,'#tab-prices')]").click

    #fill info at prices tab
    @driver.find_element(:xpath,"//input[@name = 'purchase_price']").clear
    @driver.find_element(:xpath,"//input[@name = 'purchase_price']").send_keys "17.00"

    currency = @driver.find_element(:xpath, "//select[@name = 'purchase_price_currency_code']")
    select_list3 = Selenium::WebDriver::Support::Select.new(currency)
    select_list3.select_by(:value, 'USD')

    @driver.find_element(:xpath,"//input[@name = 'prices[USD]']").send_keys "17.00"

    #save product and find it in catalog list
    @driver.find_element(:xpath, "//button[@name = 'save']").click
    @driver.find_element(:link, "#{product_name}").click #it checks that added product can be found in admin panel

    stop_browser()
  end
end