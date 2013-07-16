class FixColumnName < ActiveRecord::Migration
  def change
    change_table :tools do |t|
      t.rename :station, :location
    end
    remove_column :tools, :apparatus
  end
end
