module ApplicationHelper

  def development?
    @is_development ||= (ENV['APP_NAME'] != 'equip-db')
  end

  def journal(text)
    Journal.create(entry: text, time_stamp: DateTime.now)
  end

end
