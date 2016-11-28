class DecoratedOffer
	def initialize(offer)
		@offer = offer
	end

	def formatted_amount
		number_to_currency(@offer.salary.amount, precision: 0)
	end

	def rate
		@offer.salary.rate
	end

	def formatted_acceptance_time
		time_ago_in_words(@offer.created_at)
	end

	def remote_message
		"This is a remote position." if @offer.remote
	end

	def method_missing(m, *args, &block)
		@offer.send(m)
	end
end