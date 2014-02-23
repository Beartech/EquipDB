class ServicesController < ApplicationController
  before_action :role_required
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_tool, only: [:show, :edit, :update, :destroy]
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
    Service.transaction do
    @service = Service.new(service_params)
    @service.parts.each {|part| part.update(inventory: part.inventory - 1) unless part == ''}
    end
    if @service.save
      redirect_to tool_path(service_params[:tool_id]); gflash :success => 'Service was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update

    Service.transaction do
      current_parts = @service.parts
      new_parts_list = []
      service_params[:part_ids].each {|id| new_parts_list << Part.find(id) unless id == ''}
      put_back_parts = current_parts - new_parts_list
      put_back_parts.each {|part| part.update(inventory: part.inventory + 1) unless part == ''}
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
    Service.transaction do
      @service.parts.each {|part| part.update(inventory: part.inventory + 1)}
      @service.destroy
    end

    redirect_to services_url

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
