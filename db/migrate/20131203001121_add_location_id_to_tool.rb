class AddLocationIdToTool < ActiveRecord::Migration
  def change
    add_reference :tools, :location, index: true
    add_reference :tools, :category, index: true
  end
end
