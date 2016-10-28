class Translation < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	attr_accessor :project_name

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

	def icon
		if self.output_text
			"fa fa-check-circle-o finished"
		else
			"fa fa-clock-o unfinished"
		end
	end

	def set_project_from_name(project_name, persist=true)
	  self.project = Project.find_or_create_by(name: project_name)
	  self.save if persist
	end

	def project_name=(input)
	  set_project_from_name(input, false)
	end

end