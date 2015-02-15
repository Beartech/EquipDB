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


sku = Time.now

describe 'Parts Menu' do

    it 'should log in' do
      @browser.goto url

      @browser.text_field(id: 'username').set Logins::user

      @browser.text_field(id: 'password').set Logins::password(url)

      @browser.button(:text, 'Login').click

      @browser.link(:text, 'Parts').click
    end

  it 'should create a new part' do
    @browser.link(:text, 'Create New Part').click

    @browser.text_field(id: 'part_name').set sku.to_s

    @browser.text_field(id: 'part_sku').set sku.to_s

    @browser.text_field(id: 'part_inventory').set 10

    @browser.text_field(id: 'part_minimum').set 5

    @browser.text_field(id: 'part_maximum').set 15

    @browser.checkbox(id: 'part_consumable').clear

    @browser.button(name: 'commit').click
  end

  it 'should edit part to add sku alias' do
    @browser.link(:text, 'Parts').click

    @browser.table(id: 'parts_table').td(text: sku.to_s).present?

    row = @browser.table(id: 'parts_table').td(text: sku.to_s).parent

    row[0].text == sku

    row[1].text == sku

    row[2].text == '10'

    row[3].text == '5'

    row[4].text == '15'

    row[5].text == 'Good'

    row[5].span(class: /label-success/).present?

    row[8].link.click

    @browser.link(text: 'New SKU Alias').click

    @browser.h1(text: /Add Alias for/).present?

    alias_sku = Time.now

    @browser.text_field(id: 'part_alias_sku').set alias_sku

    @browser.input(value: 'Create Part alias').click

    @browser.p(text: "Name: #{sku}").present?

    @browser.p(text: "Sku: #{sku}").present?

    @browser.div(id: 'sku_aliases').text == "SKU Aliases for this part:\n#{alias_sku}"
  end

  it 'should delete a part' do
    @browser.link(:text, 'Parts').click

    @browser.table(id: 'parts_table').td(text: sku.to_s).present?

    row = @browser.table(id: 'parts_table').td(text: sku.to_s).parent

    row[9].link.click

    @browser.driver.switch_to.alert.accept

    @browser.table(id: 'parts_table').td(text: sku.to_s).present? == false

  end

end