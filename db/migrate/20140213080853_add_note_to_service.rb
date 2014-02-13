class AddNoteToService < ActiveRecord::Migration
  def change
    add_column :services, :note, :text
  end
end
