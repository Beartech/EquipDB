class Location < ActiveRecord::Base

  def self.vehicle_locations
    where(:vehicle => true).order(:name).pluck(:name)
  end

  def self.stations
    where(:vehicle => false).order(:name).pluck(:name)
  end

  def station_list

  end

end
