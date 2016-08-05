class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /positions
  def index
    @positions = Position.all
  end

  # GET /positions/1
  def show
  end

  # GET /positions/new
  def new
    @position = Position.new
    @position.build_salary
    @entries = Entry.all_without_position
  end

  # GET /entries/:id/add_position
  def add_new_to_existing_entry
    @offer = Offer.new
    @offer.build_salary
    @offer.entry_id = params[:id]
    render :new
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      redirect_to @position, notice: 'Position was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /positions/1
  def update
    if @position.update(position_params)
      redirect_to @position, notice: 'Position was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /positions/1
  def destroy
    @position.destroy
    redirect_to positions_url, notice: 'Position was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def position_params
      params.require(:position).permit(:job_title, :location, :remote, :start_date, :end_date, 
        entry_attributes: [:id, :user_id, :company],
        salary_attributes: [:id, :amount, :rate])
    end
end
