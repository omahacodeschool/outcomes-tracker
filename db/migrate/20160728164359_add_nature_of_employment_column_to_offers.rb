class AddNatureOfEmploymentColumnToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :nature_of_employment, :integer
  end
end
