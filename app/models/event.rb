class Event < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user

  scope :persisted, -> { where "id IS NOT NULL" }

  validates :notes, presence: true

  # Send email to everyone involved in the conversation.
  def notify
    NewEventMailer.new_event_email(users_in_conversation, entry).deliver_now
  end

  # For a event/comment, checks what other users have events/comments in the same thread or who should be notified of the event/comment.
  #
  # Returns an Array of User objects who should be notified.
  def users_in_conversation
    group = User.admins + [entry.user]
    group.delete(self.user)
    return group
  end

end
