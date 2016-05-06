class FixForeignKeyInApplications < ActiveRecord::Migration
  def change
    rename_column :applications, :user_id, :entry_id
  end
end
