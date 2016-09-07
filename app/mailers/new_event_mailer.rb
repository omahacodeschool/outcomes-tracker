class NewEventMailer < ApplicationMailer
  default from: '"Omaha Code School" <sumeet@omahacodeschool.com>'
 
  def new_event_email(users, entry)
    @users = users
    @entry = entry

    emails = @users.map(&:email)
    subject = "New comment re: #{@entry.company.name} on Outcomes Tracker"

    mail(to: emails, subject: subject)
  end
end
