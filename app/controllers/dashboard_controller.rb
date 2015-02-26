class DashboardController < ApplicationController

  before_action :role_required
  before_action :set_categories


  def dashboard

    @dashboard = Tool.all.group_by(&:location)
    @loc_id = Location.all.order(:name)

  end


  private




end

# select all tools, then order by station and then apparatus.
# iterate through each station, then find all tools in that station