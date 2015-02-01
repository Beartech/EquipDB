require 'rspec'
require 'watir-webdriver'

browser = Watir::Browser.new
browser.window.maximize

RSpec.configure do |config|
  config.before(:each) { @browser = browser }
  config.after(:suite) { browser.close unless browser.nil? }
end

url = 'https://equip-db-test.herokuapp.com'
#url = 'localhost:3000'

describe 'The Dashboard' do

  describe 'should have lots of buttons that do things' do

    it 'should log in' do
      @browser.goto url

      @browser.text_field(id: 'username').set user

      @browser.text_field(id: 'password').set password

      @browser.button(:text, 'Login').click

      @browser.link(:text, 'Dashboard').click

      @browser.ul(class: 'nav').li(text: 'Edit Profile').present?

      @browser.ul(class: 'nav').li(text: 'Logout').present?

      @browser.ul(class: 'nav').li(text: 'Logged in as: andy').present?

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
      sleep 1
      @browser.div(id: button_id).li(text: 'Put In Service').link.click

      @browser.div(id: button_id).li(text: 'Put Out of Service').present?

      @browser.div(id: button_id).link.class_name =~ /btn-in-service/

      @browser.div(id: button_id).link.click

      @browser.div(id: button_id).ul.present? == false

      @browser.div(id: button_id).link.click

      serial_num = @browser.div(id: button_id).lis[3].text

      @browser.div(id: button_id).link.click

      @browser.div(id: button_id).link.click

      @browser.div(id: button_id).lis[1].link.click

      @browser.table(id: 'show_tool_table').text =~ /#{serial_num}/

      @browser.back

    end

    it 'should go to vehicle page' do

      app_name = @browser.link(class: 'btn-app').text

      @browser.link(text: app_name).click

      @browser.h1(text: "#{app_name} Swap Equipment").exist?

      t_app = @browser.div(id: /tool_checkbox/).span(class: 'non-loaner', text: /Chainsaw/).text

      @browser.label(class: 'checkbox', text: t_app).parent.parent.checkbox.set

      t_loaner = @browser.label(for: 'apparatus_loaners', text: /Chainsaw/).text

      @browser.label(class: 'checkbox', text: t_loaner).parent.parent.checkbox.set

      @browser.select_list(id: 'apparatus_location').select 'Loaners'

      @browser.button(text: 'Update Tools').click

      @browser.label(for: 'apparatus_loaners', text: t_app).text == t_app

      @browser.div(id: /tool_checkbox/).span(class: 'loaner', text: t_loaner).text == t_loaner

      @browser.label(for: 'apparatus_loaners', text: t_app).parent.parent.checkbox.set

      @browser.div(id: /tool_checkbox/).span(class: 'loaner', text: t_loaner).parent.parent.checkbox.set

      @browser.button(text: 'Update Tools').click

      @browser.div(id: /tool_checkbox/).span(class: 'non-loaner', text: t_app).text

      @browser.label(for: 'apparatus_loaners', text: t_loaner).text

    end

    it 'should show the tool from the dropdown menu' do

      @browser.link(text: 'Dashboard').click

      @browser.link()


    end


    it 'should log out' do

      @browser.link(href: '/logout').present?

      @browser.link(href: '/logout').click

      @browser.ul(class: 'nav').li.present? == false

    end

  end
end