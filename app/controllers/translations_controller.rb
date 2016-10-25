class TranslationsController < ApplicationController
	before_action :set_job_application, only: [:show, :edit, :update, :destroy]

	def new
		@translation = Translation.new
	end

	def create
		@translation = Translation.new(translation_params)

		if @translation.save
			redirect_to root_path, notice: "Translation request submitted."
		else
			render :new
		end
	end

	def show
	end

	def index
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def set_translation
      		@translation = Translation.find(params[:id])
    	end

		def translation_params
			params.require(:translation).permit(:user_id, :input_text, :output_text)
		end
end
