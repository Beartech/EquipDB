class AddModelToTool < ActiveRecord::Migration
  def change
    add_column :tools, :model, :string
  end
end
