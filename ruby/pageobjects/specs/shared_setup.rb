require 'rspec/expectations'
require 'selenium-webdriver'
require './pageobjects/application/application.rb'


@app = nil

RSpec.configure do |config|
  config.before(:example) do
    if @app.nil?
      @app = Application.new
    end
  end

end