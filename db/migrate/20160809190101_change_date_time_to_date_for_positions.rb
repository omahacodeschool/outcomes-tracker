class ChangeDateTimeToDateForPositions < ActiveRecord::Migration
  def change
    change_column :positions, :start_date,  :date
    change_column :positions, :end_date,  :date
  end
end
