class NewEventMailerHelper 

	attr_reader :users, :entry, :company, :entry_user_name

	def initialize(users, entry)
		@users = users
		@entry = entry
		@company = @entry.company.name
		@entry_user_name = @entry.user.name
	end

	def email_subject
		if self.event_is_from_entry_owner?
	      topic = "#{self.company}"
	    else
	      topic = "#{self.entry_user_name} and #{self.company}"
	    end

	    return "New comment re: #{topic} on Outcomes Tracker"
	end

	def email_body_subject_modifier
		(self.users.include? self.entry.user) ? "your" : "#{self.entry_user_name}'s"
	end

	def user_emails
		self.users.map(&:email)
	end

	private

	def event_is_from_entry_owner?
		self.users.include?(self.entry.user)
	end

end