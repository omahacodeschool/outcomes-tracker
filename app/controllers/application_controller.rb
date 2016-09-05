class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def new_entry_prompt
  end 

  def admin_only
    if !current_user.admin?
      redirect_to :root, alert: "Access denied."
    end
  end
end
