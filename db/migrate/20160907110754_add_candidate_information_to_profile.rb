class AddCandidateInformationToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :resume, :text
    add_column :profiles, :personal_website, :string
    add_column :profiles, :linked_in, :string
    add_column :profiles, :twitter, :string
  end
end
