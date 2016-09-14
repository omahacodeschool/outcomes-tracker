class DashboardsController < ApplicationController
  def show
    if current_user.admin?
      @job_applications = JobApplication.permitted_for(current_user).timeline.page(params[:page])
    else
      @job_applications = current_user.job_applications
    end
  end
end
