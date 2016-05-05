class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :cohort_id
      t.string :gender
      t.date :birthdate
      t.string :race
      t.string :ethnicity
      t.boolean :military
      t.boolean :disability

      t.timestamps null: false
    end
  end
end
