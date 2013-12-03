class AddTypeToDropdown < ActiveRecord::Migration
  def change
    add_column :dropdowns, :type, :text
  end
end
