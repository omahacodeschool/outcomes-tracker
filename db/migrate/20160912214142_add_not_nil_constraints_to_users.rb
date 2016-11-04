class AddNotNilConstraintsToUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :name, false, "Example User"
    change_column_null :users, :github_username, false, "exampleUser"
    change_column_null :users, :email, false, "example@example.com"
  end
end
