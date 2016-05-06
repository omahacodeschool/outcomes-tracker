class AddEnumColumnToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :nature_of_employment, :integer
  end
end
