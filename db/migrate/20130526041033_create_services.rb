class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.date :due_date
      t.date :completed
      t.references :tool, index: true

      t.timestamps
    end
  end
end
