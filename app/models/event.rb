class Event < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user

  scope :persisted, -> { where "id IS NOT NULL" }

  validates :notes, presence: true

  def notify
    # message goes to a group of users -- the event/comment owner, the entry owner, and any other "instructors"
    users = self.get_users_in_conversation
    users.each { |user| NewEventMailer.new_event_email(user).deliver_later }
  end

  # For a event/comment, checks what other users have events/comments in the same thread or who should be notified of the event/comment.
  #
  # Returns an Array of User objects who should be notified.
  def get_users_in_conversation
    group = []
    if self.user != self.entry.user
      group << self.entry.user
    end
    User.admins.each do |admin|
      if !group.include?(admin)
        group << admin
      end
    end
    group
  end

end
