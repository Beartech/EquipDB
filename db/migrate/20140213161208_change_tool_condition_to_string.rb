class ChangeToolConditionToString < ActiveRecord::Migration
  def change
    change_column :tools, :condition, :string
  end
end
