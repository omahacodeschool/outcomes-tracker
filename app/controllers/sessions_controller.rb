class SessionsController < ApplicationController

  def create
    # render text: request.env['omniauth.auth'].to_yaml
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    if current_user.profile
      redirect_to root_path
    else
      redirect_to new_profile_path
      flash[:success] = "Welcome, #{@user.github_username}! Please take a moment to fill out your profile."
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end
  
end