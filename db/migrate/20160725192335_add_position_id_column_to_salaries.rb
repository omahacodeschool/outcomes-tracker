class AddPositionIdColumnToSalaries < ActiveRecord::Migration
  def change
    add_column :salaries, :position_id, :integer
  end
end
