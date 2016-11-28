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

	def offer
		@offer ||= DecoratedOffer.new(@entry.offer)
	end

	def method_missing(m, *args, &block)
		@entry.send(m)
	end

	def events_history
		@entry.events_history.map { |event| DecoratedEvent(event) }
	end
end
