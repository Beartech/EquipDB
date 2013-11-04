class ApparatusController < ApplicationController
  before_action :set_app, :only => (:index)

  def index
    @tools = Tool.location_group(@loc)
  end

  def update
    respond_to do |format|
      if
        format.html {  }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private

  def set_app
    @loc = app_params[:app]
  end

  def app_params
    params.permit(:app)
  end

  def get_locations
    stations = Dropdown.find_by_name("stations").list
    apparatus = Dropdown.find_by_name("apparatus").list
    locations = stations + apparatus
  end

  helper_method :get_locations

  def get_loaners
    Tool.loaner_tools
  end

  helper_method :get_loaners


end