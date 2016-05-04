class AlterUserSchema < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :github, :github_username
      t.text :image_url
    end
  end
end
