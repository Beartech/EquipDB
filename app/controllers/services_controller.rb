class ServicesController < ApplicationController
  before_action :role_required
  before_action :set_service, only: [:show, :edit, :update, :destroy, :archive]
  before_action :set_tool, only: [:new, :show, :edit, :update, :destroy, :archive]
  # GET /services
  # GET /services.json
  def index
    @services = Service.joins(:tool)
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit

  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to tool_path(service_params[:tool_id]); gflash :success => 'Service was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
     #replace the parts first

    Service.transaction do
      @service.expended_part_ids.uniq.each do |part_id|
        p = ExpendedPart.find(part_id)
        p.part.update(inventory: p.part.inventory + @service.expended_part_ids.count(part_id) )
        p.destroy
      end

      updated_parts = service_params[:part_ids]
      updated_parts.delete('')
      updated_parts.uniq.each do |part_id|
        p = Part.find(part_id)
        p.update(inventory: p.inventory - updated_parts.count(part_id))
      end
    end

    if @service.update(service_params)
      redirect_to tool_path(service_params[:tool_id]); gflash :success => 'Service was successfully updated.'
    else
      render action: 'edit'
    end

  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy

    @service.destroy

    redirect_to services_url

  end

  def archive

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def set_tool
      @tool = Tool.find(params[:tool_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:id, :name, :due_date, :completed, :tool_id, :service_type_id, :note, :part_ids => [])
    end
end
