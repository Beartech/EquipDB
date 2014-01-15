class AddMaximumToPart < ActiveRecord::Migration
  def change
    add_column :parts, :maximum, :int
  end
end
