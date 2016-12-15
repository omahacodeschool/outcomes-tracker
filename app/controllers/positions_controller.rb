class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]
  
  # GET /positions/new
  # not currently being used
  def new
    @position = Position.new
    @position.build_salary
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
    build_position_on_existing_entry
    @position.update(position_params)
    position_save
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
      params.require(:position).permit(:job_title, :location, :nature_of_employment, :remote, :start_date, :end_date, :entry_id,
        entry_attributes: [:id, :user_id, :company_name],
        salary_attributes: [:id, :amount, :rate])
    end

    def build_position_on_existing_entry
      entry = Entry.find(params["position"]["entry_attributes"]["id"])
      @position = entry.build_position
      @position.save
    end

    def position_save
      if @position.save
        create_new_position_event_and_redirect
      else
        render :new
      end
    end

    def create_new_position_event_and_redirect
      Event.for_position(@position)
      redirect_to @position.entry, notice: 'Position was successfully created.'
    end
end
