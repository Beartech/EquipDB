module ServicesHelper

  def get_service_names
    Service.pluck(:name).uniq
  end


end
