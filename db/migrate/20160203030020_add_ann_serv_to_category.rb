class AddAnnServToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :ann_serv, :boolean, :default => true
  end
end
