class DashboardsController < ApplicationController
  def show 
    @job_applications = current_user.job_applications
  end
end
