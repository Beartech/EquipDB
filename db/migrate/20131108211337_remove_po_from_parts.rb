class RemovePoFromParts < ActiveRecord::Migration
  def change
    remove_column :parts, :po, :varchar
  end
end
