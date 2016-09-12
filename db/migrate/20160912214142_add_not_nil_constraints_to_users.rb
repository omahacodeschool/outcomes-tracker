class AddNotNilConstraintsToUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :name, false
    change_column_null :users, :github_username, false
    change_column_null :users, :email, false
  end
end
