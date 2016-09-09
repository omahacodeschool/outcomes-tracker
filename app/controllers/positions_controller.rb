class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]
  
  # GET /positions/new
  def new
    @position = Position.new
    @position.build_salary
    @entries = Entry.all_without_position
    check_if_new_position_is_valid
  end

  # GET /entries/:id/add_position
  def add_new_to_existing_entry
    @position = Position.new
    @position.build_salary
    @entry = Entry.find(params[:id])
    @position.entry_id = @entry.id
    render :new
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      Event.for_position(@position)
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
      params.require(:position).permit(:job_title, :location, :remote, :start_date, :end_date, :entry_id,
        entry_attributes: [:id, :user_id, :company],
        salary_attributes: [:id, :amount, :rate])
    end

    def check_if_new_position_is_valid
      if @entries.length == 0 
        redirect_to offers_path, notice: 'You must have a pending offer to add a new position.'
      end 
    end
end
