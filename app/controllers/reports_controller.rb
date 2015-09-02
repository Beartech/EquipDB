class ReportsController < ApplicationController
  before_action :set_report, only: [:show]
  before_action :role_required

  # GET /reports
  # GET /reports.json
  def index

  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    case @report
      when 'hours'
        @report =  Service.find_by_sql('SELECT sub1.sum_hours,
                                  tools.serial AS serial,
                                  categories.name AS name,
                                  locations.name AS location
                                  FROM (SELECT tool_id, sum(hours) AS sum_hours
                                          FROM services
                                            JOIN service_types
                                            ON services.service_type_id = service_types.id
                                            GROUP BY services.tool_id)
                                   AS sub1
                                   JOIN tools
                                   ON sub1.tool_id = tools.id
                                   JOIN categories
                                   ON categories.id = tools.category_id
                                    JOIN locations
                                    ON locations.id = tools.location_id
                                   ORDER BY sum_hours DESC NULLS LAST')
      render '_hours_worked_report', layout: 'print_table'
      when 'parts_used'
        @report =  nil
      else
        nil
    end


  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = params[:name]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:name)
  end
end