class AddInventoryToParts < ActiveRecord::Migration
  def change
    add_column :parts, :inventory, :int
  end
end
