class RemoveRepairIdFromParts < ActiveRecord::Migration
  def change
    remove_column :parts, :repair_id, :int
  end
end
