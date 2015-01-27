require 'capybara/dsl'
include Capybara::DSL

Capybara.default_driver = :selenium

page.visit('http://equip-db-test.herokuapp.com')

page.fill_in 'Username', with: 'andy'

page.fill_in 'password', with: 'password'

page.click_button 'Login'

page.find('H1').text == 'Dashboard'

page.click_link 'Equipment'

page.click_link 'Add New Equipment'

page.fill_in 'Serial', with: Time.now

page.select 'Chainsaws', from: 'tool_category_id'

page.fill_in 'Model', with: 'Stihl TS'

page.click_on 'Stihl TS 420'

page.select '708', from: 'tool_location_id'

page.fill_in 'Purchased', with: '2015-01-07'

page.fill_in 'Put in service', with: '2015-01-11'

page.fill_in 'Cost', with: '500'

page.fill_in 'Value', with: '500'

page.check 'Currently In Service'

page.select '4', from: 'Condition'

page.click_button 'Create Tool'

page.first('td').text == 'Type: Chainsaw Tool Report Serial: 2015-01-07 00:24:36 -0800 Model: Stihl TS 420 Location: 708 Purchased: 2015-01-07 Put in service: 2015-01-11 Cost: 0.0 Value: 0.0 Status: In Service Loaner Tool?: No Retired: Condition: 4 - Good Condition Annual Service Completed: false'

#load 'create_new_service_ticket.rb'