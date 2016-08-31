class AddEnumColumnToPermissions < ActiveRecord::Migration
  def change
    add_column :permissions, :ability, :integer
  end
end
