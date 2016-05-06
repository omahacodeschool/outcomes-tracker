class AddsAbilitiesAndPermissionsTables < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :description
      t.timestamps null: false
    end

    create_table :permissions do |t|
      t.belongs_to :ability, index: true
      t.belongs_to :user, index: true
    end
  end
end
