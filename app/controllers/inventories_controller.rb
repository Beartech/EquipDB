class InventoriesController < ApplicationController

  def new

  end

  def create  #take the list of parts, parse into an array and run through transaction method
    raw_list = part_list_params[:parts_list]
    parts_array = raw_list.split("\r\n")
    @inventory = Inventory.new(parts_array)
  end

          # This method is used by the ajax call on the /new_inventory page
          # to adjust inventory when an item is scanned in. The sku is sent
          # in an array. The commit_inventory_transaction method was designed to
          # accept an array of multiple values. If loads were heavy enough part SKUs could
          # be collected before being sent as one big transaction for performance.

  def adjust_inventory
    @inventory_transaction = Inventory.new(part_list_params[:part])
    @inventory_transaction.commit_inventory_transaction(part_list_params[:operator])
    @operator = part_list_params[:operator]
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.

  def part_list_params
    params.require(:inventory).permit(:parts_list, :operator, :part => [])
  end


end
