class AddUserToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :user, index: true, foreign_key: true

    Event.all.each do |event|
      event.user_id = event.entry.user_id
      event.save
    end
  end
end
