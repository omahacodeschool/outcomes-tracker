class AddTimestampsToTranslations < ActiveRecord::Migration
  def change
  	add_timestamps :translations
  end
end
