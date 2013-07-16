class DropdownController < ApplicationController

  before_action :set_categories

  def index
    @dropdown = {categories: @categories, stations: @stations, apparatus: @apparatus}
  end


  private

  def set_categories
    @categories = Dropdown.find_by('name like ?', 'categories').list
    @stations = Dropdown.find_by('name like ?', 'stations').list
    @apparatus = Dropdown.find_by('name like ?', 'apparatus').list
  end
end