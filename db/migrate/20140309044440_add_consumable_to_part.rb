class AddConsumableToPart < ActiveRecord::Migration
  def change
    add_column :parts, :consumable, :boolean, :default => false
  end
end
