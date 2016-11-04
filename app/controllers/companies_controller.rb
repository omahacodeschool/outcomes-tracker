class CompaniesController < ApplicationController
  before_action :admin_only

  def index
    @companies = Company.permitted_for(current_user).includes(entries: :job_application)
  end

  def show
    @company = Company.includes(entries: :job_application).find(params[:id])
  end
end
