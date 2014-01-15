class DropdownController < ApplicationController
  before_action :role_required
  before_action :set_categories
  before_action :set_add_categories

  def index
    @dropdown = {categories: @categories, stations: @stations, vehicles: @vehicles}
  end

  def update_categories
    if dropdown_params[:delete_me] == '1'
      @cat = Category.find_by_name(dropdown_params[:add_category].titleize)
      @cat.destroy
    else
      @cat = Category.new(name: dropdown_params[:add_category].titleize) unless dropdown_params[:add_category] == ''
    end

    if @cat.save
      redirect_to drop_down_menus_path; gflash :success => 'Menu was successfully updated.'
    else
      redirect_to drop_down_menus_path; gflash :failure => 'No menu item added'
    end

  end

  def update_stations
    if dropdown_params[:delete_me] == '1'
      @sta = Station.find_by_name(dropdown_params[:add_station].titleize)
      @sta.destroy
    else
      @sta = Station.new(name: dropdown_params[:add_station].titleize) unless dropdown_params[:add_station] == ''
    end

    if @sta.save
      redirect_to drop_down_menus_path; gflash :success => 'Menu was successfully updated.'
    else
      redirect_to drop_down_menus_path; gflash :failure => 'No menu item added'
    end

  end

  def update_apparatus
    if dropdown_params[:delete_me] == '1'
      @veh = Vehicle.find_by_name(dropdown_params[:add_vehicle].titleize)
      @veh.destroy
    else
      @veh = Vehicle.new(name: dropdown_params[:add_vehicle].titleize) unless dropdown_params[:add_vehicle] == ''
    end

    if @veh.save
      redirect_to drop_down_menus_path; gflash :success => 'Menu was successfully updated.'
    else
      redirect_to drop_down_menus_path; gflash :failure => 'No menu item added'
    end

  end

  def edit

  end

  private

  def dropdown_params
    params.permit(:categories, :stations, :vehicles, :add_category, :add_station, :add_vehicle, :delete_me)
  end

  def set_add_categories
    @add_category = ''
    @add_station = ''
    @add_apparatus = ''
  end
end