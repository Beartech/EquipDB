class RenameToolLocation < ActiveRecord::Migration
  def change
    rename_column :tools, :location, :old_location
  end
end
