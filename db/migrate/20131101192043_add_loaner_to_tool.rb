class AddLoanerToTool < ActiveRecord::Migration
  def change
    add_column :tools, :loaner, :boolean, :default => false
  end
end
