class RenameDevLogUserIdIdToUserId < ActiveRecord::Migration
  def change
    rename_column :dev_logs, :user_id_id, :user_id
  end
end
