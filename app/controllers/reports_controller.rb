class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy ]
  before_action :role_required

  # GET /reports
  # GET /reports.json
  def index


  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    redirect_to reports_path

  end

  # GET /report/1/edit
  def edit
    redirect_to reports_path
  end

  # POST /reports
  # POST /reports.json
  def create
    redirect_to reports_path

  end

  # PATCH/PUT /reoprts/1
  # PATCH/PUT /reports/1.json
  def update
    redirect_to reports_path

  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    redirect_to reports_path

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