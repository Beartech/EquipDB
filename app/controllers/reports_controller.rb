class ReportsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :update, :destroy, :toggle_in_service, :tool_report ]
  before_action :role_required

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new

  end

  # GET /report/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create

    respond_to do |format|

    end
  end

  # PATCH/PUT /reoprts/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|

    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    respond_to do |format|

    end
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