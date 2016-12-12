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
    @driver.find_element(:xpath, "//input[@name = 'name[en]']").send_keys "#{Faker::Superhero.name}"
    @driver.find_element(:xpath, "//input[@name = 'code']").send_keys "#{Faker::Vehicle.vin}"
    @driver.find_element(:xpath,"//input[@name = 'categories[]'][@value = '1']").click
    @driver.find_element(:xpath,"//input[@name = 'product_groups[]'][@value = '1-2']").click
    @driver.find_element(:xpath,"//input[@name = 'quantity']").clear
    @driver.find_element(:xpath,"//input[@name = 'quantity']").send_keys "50.00"
    @driver.find_element(:xpath,"//input[@name = 'new_images[]']").send_keys "/Users/KateKos/Desktop/pics/carrot_PNG4997.png"

    stop_browser()
  end
end