class AddNoeColumnToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :nature_of_employment, :integer
  end
end
