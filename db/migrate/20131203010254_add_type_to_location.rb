class AddTypeToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :type, :text
  end
end
