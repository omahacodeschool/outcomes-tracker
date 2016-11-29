include ActionView::Helpers::DateHelper

class DecoratedEntry
	attr_reader :entry
	
	def initialize(entry)
		@entry = entry
	end

	def build_event
		@entry.events.build
	end

	def company_name
		@entry.company.name
	end

	def user_name
		@entry.user.name
	end

	def user_image
		@entry.user.image_url
	end

	def job_application
		@job_application ||= @entry.job_application ? DecoratedJobApplication.new(@entry.job_application) : nil
	end

	def offer
		@offer ||= @entry.offer ? DecoratedOffer.new(@entry.offer) : nil
	end

	def position
		@position ||= @entry.position ? DecoratedPosition.new(@entry.position) : nil
	end

	def has_job_application_posting_url
		!@entry.job_application.posting_url.blank?
	end

	def has_job_application_company_contact
		!@entry.job_application.company_contact.blank?
	end

	def has_job_application_notes
		!entry.job_application.notes.blank?
	end
	
	def formatted_created_time
		time_ago_in_words(@entry.created_at)
	end

	def method_missing(m, *args, &block)
		@entry.send(m)
	end

	def events_history
		@entry.events_history.map { |event| DecoratedEvent.new(event) }
	end
end
