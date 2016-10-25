class Translation < ActiveRecord::Base
	belongs_to :user

	def truncate
		self.input_text[0,50] + " ..."
	end

	def self.unfinished?
		return true if self.all_unfinished.count > 0
	end

	def self.finished
		self.where("output_text IS NOT NULL").order("updated_at DESC")
	end

	def self.unfinished
		self.where("output_text IS NULL").order("created_at DESC")
	end
end