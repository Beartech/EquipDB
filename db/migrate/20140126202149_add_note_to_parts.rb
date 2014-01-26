class AddNoteToParts < ActiveRecord::Migration
  def change
    add_column :parts, :note, :text
  end
end
