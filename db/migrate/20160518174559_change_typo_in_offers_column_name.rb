class ChangeTypoInOffersColumnName < ActiveRecord::Migration
  def change
    rename_column :offers, :reote, :remote
  end
end
