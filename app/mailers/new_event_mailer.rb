class NewEventMailer < ApplicationMailer
  default from: '"Omaha Code School" <sumeet@omahacodeschool.com>'
 
  def new_event_email(users, entry)
    @users = users
    @entry = entry

    emails = @users.map(&:email)
    subject = "New comment re: #{@entry.company.name} on Outcomes Tracker"

    mail(to: emails, subject: subject)
  end

  def new_offer_event_email(users, user, entry)
    @users = users
    @entry = entry

    emails = @users.map(&:email)
    subject = "#{user.name} just received an offer from #{@entry.company.name}!"

    mail(to: emails, subject: subject)
  end


  def new_position_event_email(users, user, entry)
    @users = users
    @entry = entry

    emails = @users.map(&:email)
    subject = "#{user.name} just accepted a position at #{@entry.company.name}!"

    mail(to: emails, subject: subject)
  end
end
