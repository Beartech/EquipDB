class MenusController < ApplicationController
  before_action :role_required
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index

    @categories = Category.all.order(name: :asc)
    @locations = Location.all.order(name: :asc)

  end

  def new
    @menu_item = menu_params[:type].constantize.new
  end

  def show

  end

  def edit

  end

  def create
    @menu = menu_params['type'].constantize.new(name: menu_params[menu_params['type'].downcase]['name'].titleize)
    case @menu.class
      when Vehicle
        @menu.vehicle = true
      when Station
        @menu.vehicle = false
      else
        @menu
    end

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu; gflash :success => 'Menu Item was successfully created.' }
      else
        format.html { redirect_to menus_path }
        @menu.errors.full_messages.each do |msg|
          gflash :error => msg
        end
      end
    end
  end

  def update
    if @menu_item.update(menu_params["#{menu_params['type'].downcase}"])
      redirect_to menu_path(menu_params[:id], :type => menu_params[:type]); gflash :success => 'Menu Item was successfully updated.'
    else
      render action: 'edit'; gflash :error => 'There was a problem updating this menu'
    end
  end

  def destroy
    respond_to do |format|
      if @menu_item.name == 'Loaners'
        format.html {redirect_to @menu_item; gflash :error => 'You can not destroy the LOANERS menu item'}
      else
        if @menu_item.tools.count == 0
          if @menu_item.destroy
            format.html { redirect_to menus_path }; gflash :success => 'Menu Item removed'
          else
            format.html {redirect_to @menu_item; gflash :error => 'You can not destroy this menu item'}
          end
        else
          format.html {redirect_to @menu_item; gflash :error => 'You can not destroy this menu item until it is empty'}
        end
      end
    end
  end

  private

  def set_menu_item
    case menu_params[:type]
      when 'Vehicle'
      @menu_item = Location.find(menu_params[:id])
      when 'Station'
        @menu_item = Location.find(menu_params[:id])
      else
        @menu_item = Category.find(menu_params[:id])
    end
  end

  def menu_params
    params.permit(:id, :name, :vehicle, :type, category: [:name], vehicle: [:name], station: [:name])
  end

end