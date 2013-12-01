class DropdownController < ApplicationController
  before_action :role_required
  before_action :set_dropdowns

  def index
    @dropdown = {categories: categories, stations: stations, apparatus: vehicle_locations}

  end

  def update_categories
    if dropdown_params[:delete_me] == '1'
      @category = Category.where(category: dropdown_params[:mod_category].titleize)
      @categories.destroy(@category)
    else
      @category = Category.new(category: dropdown_params[:add_category].titleize) unless dropdown_params[:add_category] == ''
    end

    respond_to do |format|
      if @categories.save || @category.save
        format.html { redirect_to drop_down_menus_path; gflash :success => 'menu was successfully updated.' }
      else
        format.html { redirect_to drop_down_menus_path }
      end
    end

  end

  def update_stations
    if dropdown_params[:delete_me] == '1'
      delete_me = Location.where(name: dropdown_params[:mod_category].titleize)
      @stations.destroy(delete_me)
    else
      Location.new(name: dropdown_params[:add_category].titleize, vehicle: false) unless dropdown_params[:add_category] == ''
    end

    respond_to do |format|
      if @stations.save
        format.html { redirect_to drop_down_menus_path; gflash :success => 'menu was successfully updated.' }
      else
        format.html { redirect_to drop_down_menus_path }
      end
    end

  end

  def update_apparatus
    if dropdown_params[:delete_me] == '1'
      delete_me = Location.where(name: dropdown_params[:mod_category].titleize)
      @vehicle_locations.destroy(delete_me)
    else
      Location.new(name: dropdown_params[:add_category].titleize, vehicle: true) unless dropdown_params[:add_category] == ''
    end

    respond_to do |format|
      if @vehicle_locations.save
        format.html { redirect_to drop_down_menus_path; gflash :success => 'menu was successfully updated.' }
      else
        format.html { redirect_to drop_down_menus_path }
      end
    end

  end

  def edit

  end

  private

  def dropdown_params
    params.permit(:categories, :stations, :apparatus, :mod_category, :mod_station, :mod_apparatus, :delete_me)
  end

  def set_dropdowns
    @categories = Category.all
    @stations = Location.where(:vehicle => false)
    @vehicle_locations = Location.where(:vehicle => true)
  end

end