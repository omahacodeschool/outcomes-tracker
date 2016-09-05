class RemoveAbilitiesAndAssociationinPermissions < ActiveRecord::Migration
  def change
    remove_column :permissions, :ability_id, :integer
    drop_table :abilities
  end
end
