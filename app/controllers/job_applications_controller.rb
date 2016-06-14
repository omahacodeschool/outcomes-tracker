class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  def index
    if current_user.has_view_permission
      @job_applications = JobApplication.all
    else
      @job_applications = JobApplication.retrieve_all_for_user(current_user)
    end
  end

  # GET /applications/1
  def show
  end

  # GET /applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  def create
    binding.pry
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save
      redirect_to @job_application, notice: 'Application was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /applications/1
  def update
    if @job_application.update(job_application_params)
      redirect_to @job_application, notice: 'Application was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /applications/1
  def destroy
    @job_application.destroy
    redirect_to job_applications_url, notice: 'Application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_application_params
      params.require(:job_application).permit(:location, :job_title, :remote, :posting_url, :company_contact, :notes, :date_due, 
        entry_attributes: [:id, :user_id, :company])
    end
end
