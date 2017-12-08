class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.timestamps
    	t.string :name, null: false
    	t.integer :cohort_id
    end
  end
end
