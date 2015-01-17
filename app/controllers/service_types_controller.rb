class ServiceTypesController < ApplicationController
  before_action :role_required
  before_action :set_service_type, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def index
    @service_types = ServiceType.all
  end

  def new
    @service_type = ServiceType.new
  end

  def create
    @service_type = ServiceType.new(service_type_params)
    @service_type.hours ||= 0

    respond_to do |format|
      if @service_type.save
        format.html { redirect_to @service_type; gflash :success => 'New Service Type was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      service_type_params[:part_ids] ||= []
      if @service_type.update(service_type_params)
        format.html { redirect_to @service_type; gflash :success => 'Service Type was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def show
    @service_type
  end

  def destroy

    respond_to do |format|
      if @service_type.destroy
      format.html { redirect_to service_types_url; gflash :success => 'Service Type was destroyed' }
      else
        format.html {redirect_to service_types_url}
      end
    end
  end

  def get_default_parts
    @parts_list = ServiceType.find(service_type_params[:id]).parts
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_service_type
    @service_type = ServiceType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_type_params
    params.require(:service_type).permit(:id, :name, :hours, part_ids: [])
  end

end
