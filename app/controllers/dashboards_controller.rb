class DashboardsController < ApplicationController
  def show
    if current_user.admin?
      @job_applications = JobApplication.permitted_for(current_user).timeline.page(params[:page])
    else
      @job_applications = current_user.job_applications.order("created_at DESC")
      @translations = current_user.translations.order("created_at DESC")
    end
  end
end
