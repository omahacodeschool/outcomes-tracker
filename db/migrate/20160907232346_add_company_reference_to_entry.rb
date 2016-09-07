class AddCompanyReferenceToEntry < ActiveRecord::Migration
  def change
    add_reference :entries, :company, index: true, foreign_key: true

    Entry.all.each do |entry|
      # Calling entry.company won't work, as that method is now a reference
      # to the `belongs_to :company` association in Entry.
      entry.set_company_from_name(entry.read_attribute(:company))
    end
  end
end
