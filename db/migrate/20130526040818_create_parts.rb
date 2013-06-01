class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :sku
      t.references :tool, index: true
      t.decimal :price
      t.string :po
      t.references :repair, index: true
      t.references :service, index: true

      t.timestamps
    end
  end
end
