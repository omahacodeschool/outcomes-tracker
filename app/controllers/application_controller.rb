class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def dashboard 
    if current_user
      load_dashboard
    else
      render :public
    end
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def load_dashboard
    @job_applications = current_user.job_applications
    render :dashboard_student
  end

  def new_entry_prompt
  end 

  helper_method :current_user
end
