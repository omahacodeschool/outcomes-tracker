class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:new, :index] # more views needed here?
  before_action :view_permission_check, only: [:show]
  before_action :edit_permission_check, only: [:edit]

  # GET /entries
  def index
    # note, this check may change or be relocated later
    if current_user.has_view_permission
      @entries = Entry.all
    else
      @entries = current_user.entries
    end
  end

  # GET /entries/1
  def show
    @event = @entry.events.build
  end

  # GET /entries/new
  def new
    @entry = Entry.new
    @user = current_user
  end

  # GET /entries/1/edit
  def edit
    @user = User.find(@entry.user_id)
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def user_check
      if !current_user
        redirect_to root_path, notice: 'You must log in first'
      end
    end

    def view_permission_check
      if current_user.id != @entry.user_id && current_user.has_view_permission == false # is the logic right?
        # it feels a little weird that permission to view and edit are separate. can't totally articulate why.
        redirect_to root_path, notice: 'You cannot access that page'
      end
    end

    def edit_permission_check
      if current_user.id != @entry.user_id && current_user.has_edit_permission == false
        redirect_to root_path, notice: 'You cannot access that page'
      end
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:user_id, :company, job_application_attributes: [:id, :location, :job_title, :posting_url, :company_contact, :notes ], offer_attributes: [:id, :job_title, :location, :remote])
    end
end
