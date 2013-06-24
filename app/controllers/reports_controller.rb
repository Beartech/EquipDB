class ReportsController < ApplicationController
  def index

  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = params[:name]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:name, :serial, :type, :location)
  end
end