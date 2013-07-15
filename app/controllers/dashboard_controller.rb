class DashboardController < ApplicationController

  before_action :role_required
  before_action :set_categories


  def dashboard
    #@dashboard = @stations.each do |location|
     # {name: location, equipment: [Tool.where(station: location)]}
     # end
    #@dashboard = Tool.all.station_order.app_order
    @dashboard = {}
    @stations.each do |station|
      @dashboard[station] = Tool.where('station LIKE ?', station)
    end

  end

  #comment to force heroku update

  private

  def set_categories
    @categories = Dropdown.find_by('name like ?', 'categories').list
    @stations = Dropdown.find_by('name like ?', 'stations').list
    @apparatus = Dropdown.find_by('name like ?', 'apparatus').list
  end



end

# select all tools, then order by station and then apparatus.
# iterate through each station, then find all tools in that station