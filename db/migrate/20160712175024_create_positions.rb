class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :job_title
      t.string :location
      t.boolean :remote
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
