class CreateDropdowns < ActiveRecord::Migration
  def change
    create_table :dropdowns do |t|
      t.text :name
      t.text :list

      t.timestamps
    end
  end
end
