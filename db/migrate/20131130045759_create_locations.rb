class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.boolean :vehicle

      t.timestamps
    end
  end
end
