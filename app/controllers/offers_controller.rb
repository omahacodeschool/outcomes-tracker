class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  def index
    if current_user.has_view_permission
      @offers = Offer.all
    else
      @offers = current_user.offers
    end
  end

  # GET /offers/1
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    @offer.build_salary
    @entries = Entry.all_without_offer
    check_if_new_offer_is_valid
  end

  # GET /entries/:id/add_offer
  def add_new_to_existing_entry
    @offer = Offer.new
    @offer.build_salary
    @entry = Entry.find(params[:id])
    @offer.entry_id = @entry.id
    render :new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to @offer.entry, notice: 'Offer added.'
    else
      render :new
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer updated.'
    else
      render :edit
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy
    redirect_to offers_url, notice: 'Offer deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:offer).permit(:job_title, :location, :nature_of_employment, :remote, :entry_id,
      entry_attributes: [:id, :user_id, :company],
      salary_attributes: [:id, :amount, :rate])
    end

    def check_if_new_offer_is_valid
      if @entries.length == 0 
        redirect_to offers_path, notice: 'You must first create a job application.'
      end 
    end
end
