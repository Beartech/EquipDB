class DashboardController < ApplicationController

  before_action :role_required


  def dashboard

    #@dashboard = Tool.order('locations.name').joins(:location).group_by {|t| t.location}
     @dashboard = DashView.all.group_by {|t| t.location}

  end


  private




end

# select all tools, then order by station and then apparatus.
# iterate through each station, then find all tools in that station