class CategoriesController < ApplicationController
  before_action :role_required

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def menu_params
    require(:menu).permit(:id, :name )
  end

end