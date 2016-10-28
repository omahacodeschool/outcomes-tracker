class DropProjectNameFromTranslations < ActiveRecord::Migration
  def change
  	remove_column :translations, :project_name
  	add_column :translations, :project_id, :integer, null: false
  end
end
