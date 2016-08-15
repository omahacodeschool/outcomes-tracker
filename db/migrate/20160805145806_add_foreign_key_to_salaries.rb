class AddForeignKeyToSalaries < ActiveRecord::Migration
  def change
    add_column :salaries, :offer_id, :integer
  end
end
