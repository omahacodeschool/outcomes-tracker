class AddEntryIdToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :entry_id, :integer
  end
end
