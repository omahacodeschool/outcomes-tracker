class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :institution_code
      t.integer :campus_location

      t.timestamps null: false
    end
  end
end
