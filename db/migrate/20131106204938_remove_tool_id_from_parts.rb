class RemoveToolIdFromParts < ActiveRecord::Migration
  def change
    remove_column :parts, :tool_id, :int
  end
end
