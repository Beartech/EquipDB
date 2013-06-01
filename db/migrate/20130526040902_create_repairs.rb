class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :tool, index: true

      t.timestamps
    end
  end
end
