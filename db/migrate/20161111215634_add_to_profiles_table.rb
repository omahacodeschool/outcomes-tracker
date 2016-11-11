class AddToProfilesTable < ActiveRecord::Migration
  def change
  	add_column :profiles, :gender_ndol, :integer, default: 2
  	add_column :profiles, :race_ndol, :integer, default: 7
  	add_column :profiles, :ethnicity_ndol, :integer, default: 3
  	add_column :profiles, :military_ndol, :integer, default: 2
  	add_column :profiles, :disability_ndol, :integer, default: 2
  	add_column :profiles, :first_generation_ndol, :integer, default: 2
  end
end
