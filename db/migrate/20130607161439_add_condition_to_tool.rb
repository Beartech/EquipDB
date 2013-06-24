class AddConditionToTool < ActiveRecord::Migration
  def change
    add_column :tools, :condition, :integer
  end
end
