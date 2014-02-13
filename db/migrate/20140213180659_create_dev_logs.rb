class CreateDevLogs < ActiveRecord::Migration
  def change
    create_table :dev_logs do |t|
      t.text :note
      t.references :user_id, index:true

      t.timestamps
    end
  end
end
