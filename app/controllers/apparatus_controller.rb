class ApparatusController < ApplicationController
  before_action :set_app, :only => (:index)

  def index
    @tools = Tool.location_group(@loc)
  end

  def update
    @my_tools = Tool.find(app_params['apparatus']['relocate'])
    @move_to = app_params['apparatus']['location']
    @swap_tools = Tool.find(app_params['apparatus']['swap'])
    @my_app = app_params[:app]



    #redirect_to apparatus_index_path
  end

  private

  def set_app
    @loc = app_params[:app]
  end

  def app_params
    params.permit(:app, :apparatus).tap do |whitelisted|
      whitelisted[:apparatus] = params[:apparatus]
    end
    #params.fetch(:app).permit(:location, :app, relocate: [], swap: [])

  end

  def get_locations
    stations = Dropdown.find_by_name('stations').list
    apparatus = Dropdown.find_by_name('apparatus').list
    locations = stations + apparatus
  end

  helper_method :get_locations

  def get_loaners
    Tool.loaner_tools
  end

  helper_method :get_loaners

end