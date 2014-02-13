module ApplicationHelper

  def development?
    @is_development ||= (ENV['APP_NAME'] != 'equip-db')
  end

end
