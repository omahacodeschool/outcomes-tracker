class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  def index
    if current_user.has_view_permission
      @offers = Offer.all
    else
      @offers = Offer.retrieve_all_for_user(current_user)
    end
  end

  # GET /offers/1
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    @offer.build_entry
    #not sure how the above will mesh with what I'm planning
  end

  # GET /entries/:id/add_offer
  def add_new_to_existing_entry
    @offer = Offer.new
    @offer.entry_id = params[:id]
    render :new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to @offer, notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy
    redirect_to offers_url, notice: 'Offer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:offer).permit(:job_title, :location, :nature_of_employment, :remote, 
      entry_attributes: [:id, :user_id, :company])
    end
end
