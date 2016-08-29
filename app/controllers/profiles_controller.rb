class ProfilesController < ApplicationController
  before_action :set_profile

  # GET /profiles/1/edit
  def edit
  end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      redirect_to :root, notice: 'Profile updated.'
    else
      render :edit
    end
  end

  private
    def set_profile
      current_user.initialize_profile if !current_user.profile
      @profile = current_user.profile
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:user_id, :cohort_id, :gender, :birthdate, :race, :ethnicity, :military, :disability)
    end
end
