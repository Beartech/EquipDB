class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.text :entry
      t.datetime :time_stamp

    end
  end
end
