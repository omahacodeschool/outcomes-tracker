class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :job_title
      t.string :location
      t.boolean :reote

      t.timestamps null: false
    end
  end
end
