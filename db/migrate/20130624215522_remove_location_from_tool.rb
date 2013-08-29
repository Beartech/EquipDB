class RemoveLocationFromTool < ActiveRecord::Migration
  def change
    remove_column :tools, :location
  end
end
