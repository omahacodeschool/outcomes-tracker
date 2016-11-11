class AddProjectToTranslations < ActiveRecord::Migration
  def change
  	add_column :translations, :project_name, :string, null: false, default: ''
  end
end
