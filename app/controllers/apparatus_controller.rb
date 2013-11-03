class ApparatusController < ApplicationController
  before_action :set_app

  def index
    @tools = Tool.location_group(@loc)
  end

  private

  def set_app
    @loc = app_params[:app]
  end

  def app_params
    params.permit(:app)
  end

end