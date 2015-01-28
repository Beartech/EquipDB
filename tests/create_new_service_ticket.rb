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

page.text_field(:id, 'service_name').set serial

page.text_field(:id, 'service_due_date').set '2015-01-26'

page.select_list(id: 'service_service_type_id').select 'Annual-Stihl TS400'

page.checkbox(:value, '12').wait_until_present

page.checkbox(:value, '12').clear

page.checkbox(:id, 'service_part_ids_14').exist?

page.text_field(:id, 'parts_used').set '795711478995'

page.text_field(:id, 'parts_used').send_keys :arrow_down

page.checkbox(:value, '19').exist?

page.button(:name, 'commit').click

page.table(:id, 'service_tickets_table')[0][0].text == serial


sleep 10

page.close