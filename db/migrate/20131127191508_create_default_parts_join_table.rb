class CreateDefaultPartsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :service_types, :parts do |t|
      # t.index [:service_type_id, :part_id]
      # t.index [:part_id, :service_type_id]
    end
  end
end
