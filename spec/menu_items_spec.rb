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

describe 'it should log in and CRUD menu items' do

  it 'should log in' do
    @browser.goto url

    @browser.text_field(id: 'username').set Logins::user

    @browser.text_field(id: 'password').set Logins::password(url)

    @browser.button(:text, 'Login').click

    @browser.link(:text, 'Menu Settings').click

  end

  it 'should create a new category' do
    @browser.link(:text, 'New Category').click

    @browser.element(:id, 'create_menu').click

    @browser.p(:text, "Name can't be blank").present?

    @browser.link(:text, 'New Category').click

    @browser.text_field(id: 'category_name').set 'a test cat'

    @browser.element(:id, 'create_menu').click

    @browser.h3.p(text: 'A Test Cat').present?

  end

  it 'should be able to edit the category' do
    @browser.link(text: 'Edit').click

    @browser.text_field({id: 'category_name', text: ' A Test Cat'}).exist?

    @browser.text_field(id: 'category_name').set 'A Test Cat 2'

    @browser.input(value: 'Update Category').click

    @browser.text_field({id: 'category_name', text: 'A Test Cat 2'}).exist?

  end

  it 'should be able to delete the category' do
    @browser.link(text: 'Delete').click

    @browser.driver.switch_to.alert.accept

    @browser.ul(text: 'A Test Cat 2').exist? == false

  end

  it 'should not create a duplicate category' do
    category_name = @browser.div(id: 'category_list').lis.last.text

    @browser.link(:text, 'New Category').click

    @browser.text_field(id: 'category_name').set category_name

    @browser.element(:id, 'create_menu').click

    @browser.h1(text: 'Drop Down Menu Settings').exist?

    @browser.p(:text, 'Name has already been taken').present?

  end

  it 'should not delete a category with tools still associated with it' do
    list = @browser.div(id: 'category_list').lis.to_a

    list.each do |list_item|

      @browser.link(:text, list_item.text).click

      if @browser.h4(class: 'tool_list')

        @browser.link(text: 'Delete').click

        @browser.driver.switch_to.alert.accept

        @browser.p(text: 'You can not destroy this menu item until it is empty').present?

        break

      else

        @browser.back

      end

    end

  end

  it 'should create a new vehicle' do
    @browser.link(:text, 'Menu Settings').click

    @browser.link(:text, 'New Vehicle').click

    @browser.element(:id, 'create_menu').click

    @browser.p(:text, "Name can't be blank").present?

    @browser.link(:text, 'New Vehicle').click

    @browser.text_field(id: 'vehicle_name').set '000'

    @browser.element(:id, 'create_menu').click

    @browser.h3.p(text: '000').present?

  end

  it 'should be able to edit the vehicle' do
    @browser.link(text: 'Edit').click

    @browser.text_field({id: 'vehicle_name', text: '000'}).exist?

    @browser.text_field(id: 'vehicle_name').set '000 2'

    @browser.input(value: 'Update Vehicle').click

    @browser.text_field({id: 'Vehicle_name', text: '000 2'}).exist?

  end

  it 'should be able to delete the vehicle' do
    @browser.link(text: 'Delete').click

    @browser.driver.switch_to.alert.accept

    @browser.ul(text: '000 2').exist? == false

  end

  it 'should not create a duplicate category' do
    category_name = @browser.div(id: 'vehicle_list').lis.last.text

    @browser.link(:text, 'New Vehicle').click

    @browser.text_field(id: 'vehicle_name').set category_name

    @browser.element(:id, 'create_menu').click

    @browser.h1(text: 'Drop Down Menu Settings').exist?

    @browser.p(:text, 'Name has already been taken').present?

  end

  it 'should not delete a vehicle with tools still associated with it' do
    list = @browser.div(id: 'vehicle_list').lis.to_a

    list.each do |list_item|

      @browser.link(:text, list_item.text).click

      if @browser.h4(class: 'tool_list')

        @browser.link(text: 'Delete').click

        @browser.driver.switch_to.alert.accept

        @browser.p(text: 'You can not destroy this menu item until it is empty').present?

        break

      else

        @browser.back

      end

    end

  end

  it 'should create a new station' do
    @browser.link(:text, 'Menu Settings').click

    @browser.link(:text, 'New Station').click

    @browser.element(:id, 'create_menu').click

    @browser.p(:text, "Name can't be blank").present?

    @browser.link(:text, 'New Station').click

    @browser.text_field(id: 'station_name').set 'a test station'

    @browser.element(:id, 'create_menu').click

    @browser.h3.p(text: 'A Test Station').present?

  end

  it 'should be able to edit the station' do
    @browser.link(text: 'Edit').click

    @browser.text_field({id: 'station_name', text: ' A Test Station'}).exist?

    @browser.text_field(id: 'station_name').set 'A Test Station 2'

    @browser.input(value: 'Update Station').click

    @browser.text_field({id: 'station_name', text: 'A Test Cat 2'}).exist?

  end

  it 'should be able to delete the station' do
    @browser.link(text: 'Delete').click

    @browser.driver.switch_to.alert.accept

    @browser.ul(text: 'A Test Station 2').exist? == false

  end

  it 'should not create a duplicate station' do
    category_name = @browser.div(id: 'station_list').lis.last.text

    @browser.link(:text, 'New Station').click

    @browser.text_field(id: 'station_name').set category_name

    @browser.element(:id, 'create_menu').click

    @browser.h1(text: 'Drop Down Menu Settings').exist?

    @browser.p(:text, 'Name has already been taken').present?

  end

  it 'should not delete a station with tools still associated with it' do
    list = @browser.div(id: 'station_list').lis.to_a

    list.each do |list_item|

      @browser.link(:text, list_item.text).click

      if @browser.h4(class: 'tool_list')

        @browser.link(text: 'Delete').click

        @browser.driver.switch_to.alert.accept

        @browser.p(text: 'You can not destroy this menu item until it is empty').present?

        break

      else

        @browser.back

      end

    end

  end

end
