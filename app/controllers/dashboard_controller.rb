class DashboardController < ApplicationController

  before_action :role_required
  before_action :set_categories


  def dashboard

    @dashboard = {}
    all_tools = Tool.all.order(:location)
    @locations.each do |location|
      @dashboard[location] = all_tools.where('location = ?', location).order(:name)
    end

  end


  private

  def set_categories
    @categories = Dropdown.find_by('name like ?', 'categories').list
    @stations = Dropdown.find_by('name like ?', 'stations').list
    @apparatus = Dropdown.find_by('name like ?', 'apparatus').list
    @locations = @apparatus + @stations
  end



end

# select all tools, then order by station and then apparatus.
# iterate through each station, then find all tools in that station