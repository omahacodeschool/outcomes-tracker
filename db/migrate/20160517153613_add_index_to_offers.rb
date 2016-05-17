class AddIndexToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :entry_id, :integer
  end
end
