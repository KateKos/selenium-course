require './helpers.rb'

describe 'Products' do
  before (:each) do
    browser_launch()
  end

  it 'checks correct product' do
    sign_in('admin', 'admin')
    @driver.navigate.to 'http://localhost/litecart/en/'
    
    #getting product prices style on product page
    @driver.find_elements(:xpath, "//*[@id='box-campaigns']/div/ul/li/a").first.click
    
    regular_price_text = @driver.find_element(:xpath, "//s[text()='$20']").css_value("text-decoration")
    regular_price_fsize = @driver.find_element(:xpath, "//s[@class='regular-price']").css_value("font-size")
    regular_price_fweight = @driver.find_element(:xpath, "//s[@class='regular-price']").css_value("font-weight")
    
    campaign_price_text = @driver.find_element(:xpath, "//strong[text()='$18']").css_value("text-decoration")
    campaign_price_color = @driver.find_element(:xpath, "//strong[text()='$18']").css_value("color")
    campaign_price_fsize = @driver.find_element(:xpath, "//strong[@class='campaign-price']").css_value("font-size")
    campaign_price_fweight = @driver.find_element(:xpath, "//strong[@class='campaign-price']").css_value("font-weight")

    #checking product prices style on product page with correct values
    if regular_price_text == ('line-through')
      puts "Regular price text is correct"
    else
      puts "Regular price text was changed"
    end

    if regular_price_fsize == ('16px')
      puts "Regular price font size is correct"
    else
      puts "Regular price font size was changed"
    end

    if regular_price_fweight == ('normal')
      puts "Regular price font weight is correct"
    else
      puts "Regular price font weight was changed"
    end

    if campaign_price_text == ('none')
      puts "Campaign price text is correct"
    else
      puts "Campaign price text was changed"
    end

    if campaign_price_color == ('rgba(204, 0, 0, 1)')
      puts "Campaign price text color is correct"
    else
      puts "Campaign price text color was changed"
    end

    if campaign_price_fsize == ('22px')
      puts "Campaign price font size is correct"
    else
      puts "Campaign price font size was changed"
    end

    if campaign_price_fweight == ('bold')
      puts "Campaign price font weight is correct"
    else
      puts "Campaign price font weight was changed"
    end

    stop_browser()
  end
end