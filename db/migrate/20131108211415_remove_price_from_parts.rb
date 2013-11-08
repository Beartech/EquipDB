class RemovePriceFromParts < ActiveRecord::Migration
  def change
    remove_column :parts, :price, :float
  end
end
