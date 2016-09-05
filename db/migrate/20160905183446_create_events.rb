class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :entry, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
