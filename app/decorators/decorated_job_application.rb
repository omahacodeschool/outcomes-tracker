class DecoratedJobApplication
	attr_reader :job_application

	def initialize(job_application)
		@job_application = job_application
	end

	def method_missing(m, *args, &block)
		@job_application.send(m)
	end
end