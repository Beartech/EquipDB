class AddNoteToTool < ActiveRecord::Migration
  def change
    add_column :tools, :note, :text
  end
end
