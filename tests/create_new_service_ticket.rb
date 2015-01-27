require 'watir-webdriver'

url = 'https://equip-db-test.herokuapp.com'

page = Watir::Browser.new :firefox

page.goto url

page.text_field(id: 'username').set 'andy'

page.text_field(id: 'password').set 'password'

page.button(:value, 'Login').click

page.link(:text, 'Equipment').click

page.link(:text, '00083').click

page.link(:text, 'New Service Ticket').click

serial = Time.now

page.text_field(:name, 'Name').set serial

page.text_field(:name, 'Due date').set '2015-01-26'

page.select 'Annual-Stihl TS400', from: 'service_service_type_id'

page.find(:id, 'default_parts_list').text.include? 'Stihl TS400 Air Filter kit 795711159863 Stihl/Denso Spark Plug W22mp-u/BPMR7A 042511060272'

page.uncheck 'service_part_ids_12'

page.fill_in 'parts_used', with: '795711478995'

page.find(:id, 'parts_used').native.send_keys :arrow_down

page.find(:id, 'default_parts_list').text.include? 'Stihl Fuel Filter 795711478995'

page.click_button('Create Service')

page.find(:id, 'service_tickets_table')[0][0].text == serial


sleep 10