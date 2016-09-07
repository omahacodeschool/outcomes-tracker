class NewEventMailer < ApplicationMailer
  default from: '"Omaha Code School" <sumeet@omahacodeschool.com>'
 
  def new_event_email(user, entry)
    @user = user
    @entry = entry
    subject = "New comment re: #{@entry.company} on Outcomes Tracker"
    
    mail(to: @user.email, subject: subject)
  end
end
