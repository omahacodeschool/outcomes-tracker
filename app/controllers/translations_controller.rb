class TranslationsController < ApplicationController
	before_action :set_translation, only: [:show, :edit, :update, :destroy]
	before_action :admin_only, only: [:edit, :index]
	before_action :must_have_candidate_profile, only: [:new, :create]
	autocomplete :project, :name

	def new
		@translation = Translation.new
	end

	def create
		@translation = Translation.new(translation_params)

		if @translation.save
			redirect_to new_translation_path, notice: "Translation request submitted."
		else
			render :new
		end
	end

	def show
	end

	def index
		@finished_translations = Translation.finished
		@new_translations = Translation.unfinished
	end

	def edit
	end
	
	def update
		if @translation.update(translation_params)
			redirect_to translations_path, notice: "Translation saved!"
		else
			render :edit
		end
	end

	def destroy
	end

	private
		def set_translation
      		@translation = Translation.find(params[:id])
    	end

		def translation_params
			params.require(:translation).permit(:user_id, :input_text, :output_text, :project_name)
		end
end
