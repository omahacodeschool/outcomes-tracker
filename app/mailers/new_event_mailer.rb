class NewEventMailer < ApplicationMailer
  default from: 'sumeet@omahacodeschool.com'
 
  def new_event_email(user, entry)
    @user = user
    @entry = entry
    # this will change to URL for the exact entry.
    mail(to: @user.email, subject: 'New comments on a thread you are following')
  end
end
