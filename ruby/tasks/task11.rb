require './helpers.rb'

describe 'New account' do
  before (:each) do
    browser_launch()
  end

  it 'creates new account in litecart' do

    @driver.navigate.to 'http://localhost/litecart/en/'
    @driver.find_element(:xpath, "//a[contains(@href,'/create_account')]").click

    #create new account
    @driver.find_element(:xpath, "//input[@name = 'firstname']").send_keys "#{Faker::Name.first_name}"
    @driver.find_element(:xpath, "//input[@name = 'lastname']").send_keys "#{Faker::Name.last_name}"
    @driver.find_element(:xpath, "//input[@name = 'address1']").send_keys "#{Faker::Address.street_address}"
    @driver.find_element(:xpath, "//input[@name = 'postcode']").send_keys "#{Faker::Number.number(6)}"
    @driver.find_element(:xpath, "//input[@name = 'city']").send_keys "#{Faker::Address.city}"
    
    email = Faker::Internet.free_email #remember this to test login
    @driver.find_element(:xpath, "//input[@name = 'email']").send_keys "#{email}"
    @driver.find_element(:xpath, "//input[@name = 'phone']").send_keys "#{'+79' + Faker::Number.number(8)}"
    
    password = Faker::Internet.password(10, 20, true) #remember this to test login
    @driver.find_element(:xpath, "//input[@name = 'password']").send_keys "#{password}"
    @driver.find_element(:xpath, "//input[@name = 'confirmed_password']").send_keys "#{password}"
    @driver.find_element(:xpath, "//button[@name = 'create_account']").click

    #logout and login with new account
    @driver.find_element(:xpath, "//a[contains(@href,'/logout')]").click
    @driver.find_element(:xpath, "//input[@name = 'email']").send_keys "#{email}"
    @driver.find_element(:xpath, "//input[@name = 'password']").send_keys "#{password}"
    @driver.find_element(:xpath, "//input[@name = 'remember_me']").click
    @driver.find_element(:xpath, "//button[@name = 'login']").click
    @driver.find_element(:xpath, "//a[contains(@href,'/logout')]").click
    
    stop_browser()
  end
end