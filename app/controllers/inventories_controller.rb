class InventoriesController < ApplicationController

  def new

  end

  def create  #take the list of parts, parse into an array and run through transaction method
    raw_list = part_list_params[:parts_list]
    parts_array = raw_list.split("\r\n")
    @inventory = Inventory.new(parts_array)
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.

  def part_list_params
    params.require(:inventory).permit(:parts_list)
  end


end
