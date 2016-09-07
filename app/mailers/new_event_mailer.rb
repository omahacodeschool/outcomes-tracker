class NewEventMailer < ApplicationMailer
  default from: '"Omaha Code School" <sumeet@omahacodeschool.com>'
 
  def new_event_email(users, entry)
    @users = user
    @entry = entry

    emails = @users.map(&:email)
    subject = "New comment re: #{@entry.company} on Outcomes Tracker"

    mail(to: emails, subject: subject)
  end
end
