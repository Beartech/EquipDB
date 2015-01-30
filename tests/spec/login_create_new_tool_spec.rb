require 'rspec'
require 'watir'
require 'watir-webdriver'

browser = Watir::Browser.new

RSpec.configure do |config|
  config.before(:each) { @browser = browser }
  config.after(:suite) { browser.close unless browser.nil? }
end


#url = 'https://equip-db-test.herokuapp.com' ; user = 'andy' ; password = 'password'
url = 'localhost:3000' ; user = 'andy' ; password = 'equH3i2r7e9d5'

serial = Time.now

describe 'it should log in and create a new tool' do

  it 'should log in' do
    @browser.goto url

    @browser.text_field(id: 'username').set user

    @browser.text_field(id: 'password').set password

    @browser.button(:text, 'Login').click

    @browser.link(:text, 'Equipment').click

  end


  it 'should create a new tool' do

    @browser.link(text: 'Add New Equipment').click

    @browser.text_field(id: 'tool_serial').set serial

    @browser.select_list(id: 'tool_category_id').select 'Chainsaws'

    @browser.text_field(id: 'tool_model').set 'Stihl TS 420'

    #@browser.li(data_value: 'Stihl TS 420').when_present.click

    @browser.select_list(id: 'tool_location_id').select '708'

    @browser.text_field(id: 'tool_purchased').set '2015-01-07'

    @browser.text_field(id: 'tool_put_in_service').set '2015-01-11'

    @browser.text_field(id: 'tool_cost').set '500'

    @browser.text_field(id: 'tool_value').set '500'

    @browser.checkbox(id: 'tool_in_service').set

    @browser.select_list(id: 'tool_condition').select '4 - Good Condition'

    @browser.button(text: 'Create Tool').click

    @browser.table(id: 'show_tool_table')[0][0].text.should == "Type: Chainsaw Tool Report\nSerial: #{serial}\nModel: Stihl TS 420\nLocation: 708\nPurchased: 2015-01-07\nPut in service: 2015-01-11\nCost: 500.0\nValue: 500.0\nStatus: In Service\nLoaner Tool?: No\nRetired:\nCondition: 4 - Good Condition\nAnnual Service Completed: false"

  end

end