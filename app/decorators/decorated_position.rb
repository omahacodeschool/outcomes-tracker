include ActionView::Helpers::NumberHelper
include ActionView::Helpers::DateHelper

class DecoratedPosition
	def initialize(position)
		@position = position
	end

	def formatted_amount
		number_to_currency(@position.salary.amount, precision: 0)
	end

	def rate
		@position.salary.rate
	end

	def formatted_acceptance_time
		time_ago_in_words(@position.created_at)
	end

	def remote_message
		"This is a remote position." if @position.remote
	end

	def method_missing(m, *args, &block)
		@position.send(m)
	end
end