class RemoveServiceIdFromParts < ActiveRecord::Migration
  def change
    remove_column :parts, :service_id, :int
  end
end
