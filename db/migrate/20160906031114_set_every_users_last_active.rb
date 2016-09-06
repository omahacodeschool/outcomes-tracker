class SetEveryUsersLastActive < ActiveRecord::Migration
  def change
    User.all.each do |user|
      user.touch(:last_active_at)
    end
  end
end
