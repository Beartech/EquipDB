require 'capybara/dsl'
include Capybara::DSL

Capybara.default_driver = :selenium

page.visit('http://equip-db-test.herokuapp.com')

page.fill_in 'Username', with: 'andy'

page.fill_in 'password', with: 'password'

page.click_button 'Login'

page.find('H1').text == 'Dashboard'

page.click_link 'Equipment'

page.click_link '00083'

page.click_link 'New Service Ticket'

serial = Time.now

page.fill_in 'Name', with: serial

page.fill_in 'Due date', with: '2015-01-26'

page.select 'Annual-Stihl TS400', from: 'service_service_type_id'

page.find(:id, 'default_parts_list').text.include? 'Stihl TS400 Air Filter kit 795711159863 Stihl/Denso Spark Plug W22mp-u/BPMR7A 042511060272'

page.uncheck 'service_part_ids_12'

page.fill_in 'parts_used', with: '795711478995'

page.find(:id, 'parts_used').native.send_keys :arrow_down

page.find(:id, 'default_parts_list').text.include? 'Stihl Fuel Filter 795711478995'

page.click_button('Create Service')

#page.table(:id, 'service_tickets_table')[0][0].text == serial
t = page.tables[1]

t[0][0].text == serial

sleep 10