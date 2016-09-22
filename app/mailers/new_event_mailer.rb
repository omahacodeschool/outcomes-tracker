class NewEventMailer < ApplicationMailer
  default from: '"Omaha Code School" <sumeet@omahacodeschool.com>'
 
  def new_event_email(users, entry)
    @users = users
    @entry = entry

    emails = @users.map(&:email)

    topic = (@users.include?(@entry.user)) ? "#{@entry.company.name}" : "#{@entry.user.name} and #{@entry.company.name}"

    subject = "New comment re: #{topic} on Outcomes Tracker"

    @subject_modifier = (@users.include?@entry.user) ? "your" : "#{@entry.user.name}'s"

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
