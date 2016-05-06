class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :location
      t.string :job_title
      t.boolean :remote
      t.string :posting_url
      t.string :company_contact
      t.text :notes
      t.date :date_due

      t.timestamps null: false
    end
  end
end
