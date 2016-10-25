class Translation < ActiveRecord::Base
	belongs_to :user

	def truncate
		self.input_text[0,50] + " ..."
	end
end