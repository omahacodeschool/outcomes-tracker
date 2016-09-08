class RemoveCompanyFromEntry < ActiveRecord::Migration
  def change
    remove_column :entries, :company, :string
  end
end
