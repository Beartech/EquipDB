class DropdownController < ApplicationController
  before_action :role_required
  before_action :set_categories
  before_action :set_add_categories

  def index
    categories = Dropdown.find_by('name like ?', 'categories').list
    stations = Dropdown.find_by('name like ?', 'stations').list
    apparatus = Dropdown.find_by('name like ?', 'apparatus').list
    @dropdown = {categories: categories, stations: stations, apparatus: apparatus}
  end

  def update_categories
    if dropdown_params[:delete_me] == '1'
      @categories.list.delete(dropdown_params[:add_category].titleize)
    else
      @categories.list.push(dropdown_params[:add_category].titleize) unless dropdown_params[:add_category] == ''
    end
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
    if dropdown_params[:delete_me] == '1'
      @stations.list.delete(dropdown_params[:add_station].titleize)
    else
      @stations.list.push(dropdown_params[:add_station].titleize) unless dropdown_params[:add_station] == ''
    end
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
    if dropdown_params[:delete_me] == '1'
      @apparatus.list.delete(dropdown_params[:add_apparatus].titleize)
    else
      @apparatus.list.push(dropdown_params[:add_apparatus].titleize) unless dropdown_params[:add_apparatus] == ''
    end
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
    params.permit(:categories, :stations, :apparatus, :add_category, :add_station, :add_apparatus, :delete_me)
  end

  def set_add_categories
    @add_category = ''
    @add_station = ''
    @add_apparatus = ''
  end
end