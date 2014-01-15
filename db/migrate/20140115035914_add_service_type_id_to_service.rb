class AddServiceTypeIdToService < ActiveRecord::Migration
  def change
    add_column :services, :service_type_id, :int
  end
end
