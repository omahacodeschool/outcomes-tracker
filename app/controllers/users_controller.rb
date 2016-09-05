class UsersController < ApplicationController
  before_action :admin_only

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
