class ApparatusController < ApplicationController
  before_action :set_app, :only => (:index)
  before_action :role_required
  before_action :set_categories

  def index
    loc = Location.find_by_name(@loc)
    @tools = Tool.where(location_id: loc.id).order(:name)
  end

  def update
    if Tool.swap_tools(app_params)
      redirect_to apparatus_index_path
      gflash :success => 'Equipment Swapped.'
    else
      redirect_to apparatus_index_path
    end

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

  def get_loaners
    Tool.loaner_tools.order(:name)
  end

  helper_method :get_loaners



end