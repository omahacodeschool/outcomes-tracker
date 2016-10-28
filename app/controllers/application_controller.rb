class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :update_last_active_timestamp
  before_action :check_if_logged_in

  def update_last_active_timestamp
    current_user.touch(:last_active_at) if current_user
  end
  
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def sumeet
    @sumeet ||= User.find_by_github_username("sumeetjain")
  end
  helper_method :sumeet

  def alex
    @alex ||= User.find_by_github_username("halfghaninne")
  end
  helper_method :alex

  def check_if_logged_in
    if !current_user
      render "pages/public" and return
    end
  end

  def admin_only
    if !current_user.admin?
      redirect_to :root, alert: "Access denied."
    end
  end

  def must_have_candidate_profile
    if current_user.missing_candidate_profile
      redirect_to :update_profile, alert: "You must add candidate information to your profile before using this feature."
    end
  end
end
