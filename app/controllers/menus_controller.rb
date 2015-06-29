class MenusController < ApplicationController
  #before_action :role_required
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index

    @categories = Category.all.order(name: :asc)
    @locations = Location.all.order(name: :asc)

  end

  def new
    @menu_item = Category.new
  end

  def show

  end

  def edit

  end

  def create

  end

  def update
    if @menu_item.update(menu_params["#{menu_params['type'].downcase}"])
      redirect_to menu_path(menu_params[:id], :type => menu_params[:type]); gflash :success => 'Menu Item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy

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