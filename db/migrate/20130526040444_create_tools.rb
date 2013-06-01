class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :serial
      t.string :location
      t.date :purchased
      t.date :put_in_service
      t.decimal :cost
      t.decimal :value
      t.boolean :in_service
      t.date :retired

      t.timestamps
    end
  end
end
