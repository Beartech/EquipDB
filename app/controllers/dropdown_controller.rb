class DropdownController < ApplicationController
  before_action :role_required
  before_action :set_categories

  def index
    categories = Dropdown.find_by('name like ?', 'categories').list
    stations = Dropdown.find_by('name like ?', 'stations').list
    apparatus = Dropdown.find_by('name like ?', 'apparatus').list
    @dropdown = {categories: categories, stations: stations, apparatus: apparatus}
  end

  def update_categories
    @categories.list.push(dropdown_params[:add_category])
    @categories.list.sort!
    respond_to do |format|
      if @categories.save
        format.html { redirect_to drop_down_menus_path; gflash :success => 'menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to drop_down_menus_path }
        format.json { render json: @categories.errors, status: :unprocessable_entity }
      end
    end

  end

  def update_stations
    @stations.list.push(dropdown_params[:add_station])
    @stations.list.sort!
    respond_to do |format|
      if @stations.save
        format.html { redirect_to drop_down_menus_path; gflash :success => 'menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to drop_down_menus_path }
        format.json { render json: @stations.errors, status: :unprocessable_entity }
      end
    end

  end

  def update_apparatus
    @apparatus.list.push(dropdown_params[:add_apparatus])
    @apparatus.list.sort!
    respond_to do |format|
      if @apparatus.save
        format.html { redirect_to drop_down_menus_path; gflash :success => 'menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to drop_down_menus_path }
        format.json { render json: @apparatus.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit

  end

  private

  def dropdown_params
    params.permit(:categories, :stations, :apparatus, :add_category, :add_station, :add_apparatus)
  end

  def set_categories
    @categories = Dropdown.find_by('name like ?', 'categories')
    @stations = Dropdown.find_by('name like ?', 'stations')
    @apparatus = Dropdown.find_by('name like ?', 'apparatus')
    @add_category = ''
    @add_station = ''
    @add_apparatus = ''
  end
end