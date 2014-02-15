class CreateExpendedParts < ActiveRecord::Migration
  def change
    create_table :expended_parts do |t|
      t.references :part, index: true
      t.references :service, index: true

      t.timestamps
    end
  end
end
