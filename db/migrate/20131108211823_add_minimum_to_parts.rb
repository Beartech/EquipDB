class AddMinimumToParts < ActiveRecord::Migration
  def change
    add_column :parts, :minimum, :int
  end
end
