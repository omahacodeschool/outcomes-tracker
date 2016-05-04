class CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :edit, :update, :destroy]

  # GET /cohorts
  def index
    @cohorts = Cohort.all
  end

  # GET /cohorts/1
  def show
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
  end

  # GET /cohorts/1/edit
  def edit
  end

  # POST /cohorts
  def create
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      redirect_to @cohort, notice: 'Cohort was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cohorts/1
  def update
    if @cohort.update(cohort_params)
      redirect_to @cohort, notice: 'Cohort was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cohorts/1
  def destroy
    @cohort.destroy
    redirect_to cohorts_url, notice: 'Cohort was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort
      @cohort = Cohort.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cohort_params
      params.require(:cohort).permit(:name, :school_id, :start_date, :end_date)
    end
end
