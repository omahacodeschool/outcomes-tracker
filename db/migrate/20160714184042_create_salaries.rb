class CreateSalaries < ActiveRecord::Migration
  def change
    create_table :salaries do |t|
      t.integer :amount
      t.integer :rate

      t.timestamps null: false
    end
  end
end
