require 'rspec'
require 'watir-webdriver'

browser = Watir::Browser.new

RSpec.configure do |config|
  config.before(:each) { @browser = browser }
  config.after(:suite) { browser.close unless browser.nil? }
end


#url = 'https://equip-db-test.herokuapp.com' ; user = 'andy' ; password = 'password'
url = 'localhost:3000' ; user = 'andy' ; password = 'equH3i2r7e9d5'

describe 'The Dashboard' do

  describe 'should have lots of buttons that do things' do

    it 'should log in' do
      @browser.goto url

      @browser.text_field(id: 'username').set user

      @browser.text_field(id: 'password').set password

      @browser.button(:text, 'Login').click

      @browser.link(:text, 'Dashboard').click

    end

    it 'should show dropdown and toggle in/out of service when clicked' do

      button_id = @browser.link(class: /btn-in-service/).parent.id

      @browser.div(id: button_id).ul.present? == false

      @browser.div(id: button_id).link.click

      @browser.div(id: button_id).ul.present?

      @browser.div(id: button_id).li(text: 'Put Out of Service').present?

      @browser.div(id: button_id).li(text: 'Put Out of Service').link.click

      @browser.div(id: button_id).link.class_name =~ /btn-out-service/

      @browser.div(id: button_id).li(text: 'Put In Service').present?

      @browser.div(id: button_id).li(text: 'Put In Service').link.click

      @browser.div(id: button_id).li(text: 'Put Out of Service').present?

      @browser.div(id: button_id).link.class_name =~ /btn-in-service/

      @browser.div(id: button_id).link.click

      @browser.div(id: button_id).ul.present? == false

    end


  end
end