class RemoveNameFromPositions < ActiveRecord::Migration
  def change
    remove_column :positions, :name, :string
  end
end
