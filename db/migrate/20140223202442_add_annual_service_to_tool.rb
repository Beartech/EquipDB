class AddAnnualServiceToTool < ActiveRecord::Migration
  def change
    add_column :tools, :annual_service, :boolean, :default => false
  end
end
