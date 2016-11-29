include ActionView::Helpers::TextHelper
include ActionView::Helpers::DateHelper

class DecoratedEvent
	def initialize(event)
		@event = event
	end

	def image_url
		@event.user.image_url
	end

	def formatted_notes
		simple_format(@event.notes)
	end

	def name
		@event.user.name
	end

	def formatted_time_ago
		time_ago_in_words(@event.created_at)
	end
end