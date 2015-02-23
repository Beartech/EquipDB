class AddCategoryToParts < ActiveRecord::Migration
  def change
    add_column :parts, :category, :string
  end
end
