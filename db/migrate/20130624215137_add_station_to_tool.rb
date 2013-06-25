class AddStationToTool < ActiveRecord::Migration
  def change
    add_column :tools, :station, :text
  end
end
