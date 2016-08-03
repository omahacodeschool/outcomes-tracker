class RemoveCompletedProfileFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :completed_profile, :boolean
  end
end
