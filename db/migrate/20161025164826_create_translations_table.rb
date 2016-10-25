class CreateTranslationsTable < ActiveRecord::Migration
  def change
    create_table :translations do |t|
    	t.integer :user_id
    	t.string :input_text, null:false
    	t.string :output_text, :limit => 106
    end
  end
end
