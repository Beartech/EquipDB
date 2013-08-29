class AddApparatusToTool < ActiveRecord::Migration
  def change
    add_column :tools, :apparatus, :text
  end
end
