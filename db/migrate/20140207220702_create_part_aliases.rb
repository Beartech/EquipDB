class CreatePartAliases < ActiveRecord::Migration
  def change
    create_table :part_aliases do |t|
      t.string :sku
      t.references :part, index: true

      t.timestamps
    end
  end
end
