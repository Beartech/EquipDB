class DashboardController < ApplicationController

  before_action :role_required
  before_action :set_categories


  def dashboard

    @dashboard = {}
    all_tools = Tool.all
    @loc_id = Location.all.order(:name)
    @loc_id.each do |location|
      @dashboard[location.id] = all_tools.where('location_id = ?', location.id).order(:name)
    end

  end


  private




end

# select all tools, then order by station and then apparatus.
# iterate through each station, then find all tools in that station