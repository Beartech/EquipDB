require 'rspec'
require 'watir'
require 'watir-webdriver'
require 'logins'

browser = Watir::Browser.new
browser.window.maximize

RSpec.configure do |config|
  config.before(:each) { @browser = browser }
  config.after(:suite) { browser.close unless browser.nil? }
end


#url = 'https://equip-db-test.herokuapp.com'
url = 'localhost:3000'


serial = Time.now

describe 'It should create a new service ticket' do

    it 'should log in' do
      @browser.goto url

      @browser.text_field(id: 'username').set Logins::user

      @browser.text_field(id: 'password').set Logins::password(url)

      @browser.button(:text, 'Login').click

      @browser.link(:text, 'Parts').click

      $part_19_start = @browser.link(:href => /parts\/19/).parent.parent[2].text.to_i

      $part_12_start = @browser.link(:href => /parts\/12/).parent.parent[2].text.to_i

      $part_14_start = @browser.link(:href => /parts\/14/).parent.parent[2].text.to_i

    end

    it 'should create the ticket' do
      @browser.link(:text, 'Equipment').click

      @browser.link(:text, '00083').click

      @browser.link(:text, 'New Service Ticket').click

      @browser.text_field(:id, 'service_name').set serial

      @browser.text_field(:id, 'service_due_date').set '2015-01-26'

      @browser.select_list(id: 'service_service_type_id').select 'Annual-Stihl TS400'

      @browser.checkbox(:value, '12').wait_until_present

      @browser.checkbox(:value, '12').clear

      @browser.checkbox(:id, 'service_part_ids_14').exist?

      @browser.text_field(:id, 'parts_used').set '795711478995'

      @browser.text_field(:id, 'parts_used').send_keys :arrow_down

      sleep 2  #need to wait for the JS checkbox to appear

      @browser.checkbox(:value, '19').exist?

      @browser.button(:name, 'commit').click

      @browser.table(:id, 'service_tickets_table')[2][0].text.should == "#{serial}"
    end

    it 'should check that inventory is correct' do
      @browser.link(:text, 'Parts').click

      @part_19_count = @browser.link(:href => /parts\/19/).parent.parent[2].text.to_i

      @part_12_count = @browser.link(:href => /parts\/12/).parent.parent[2].text.to_i

      @part_14_count = @browser.link(:href => /parts\/14/).parent.parent[2].text.to_i

      @part_12_count.should == $part_12_start

      @part_14_count.should == ($part_14_start - 1)

      @part_19_count.should == ($part_19_start - 1)
    end

    it 'should put parts back when deleted' do
      @browser.link(:text, 'Service').click

      @browser.td(class: 'service_name', text: serial.to_s).parent[7].link.click
      sleep 1
      @browser.driver.switch_to.alert.accept
      sleep 1
      @browser.link(:text, 'Parts').click
      sleep 1
      @part_19_count = @browser.link(:href => /parts\/19/).parent.parent[2].text.to_i

      @part_12_count = @browser.link(:href => /parts\/12/).parent.parent[2].text.to_i

      @part_14_count = @browser.link(:href => /parts\/14/).parent.parent[2].text.to_i

      @part_14_count.should == $part_14_start

      @part_12_count.should == $part_12_start

      @part_19_count.should == $part_19_start

    end

    it 'should no longer exist' do
      @browser.link(:text, 'Service').click

      @browser.text.should_not =~ /serial.to_s/

    end

end
