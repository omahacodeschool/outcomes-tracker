class SessionsController < ApplicationController
  skip_before_action :check_if_logged_in, only: [:create]

  def create
    if user_is_whitelisted(request.env['omniauth.auth'])
      begin
        @user = User.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.name}!"
      rescue
        flash[:warning] = "There was an error while trying to authenticate you."
      end
      # SUGGESTION INSTEAD OF WHAT IS BELOW:
      # if first_user_login <-- not sure how to do this yet
      # # redirect_to :update_profile
      # else
      # # redirect_to :root_path
      # end
      if current_user.profile
        redirect_to root_path
      else
        current_user.initialize_profile
        # Eventually this will move b/c Staff User will initialize profile
        redirect_to :update_profile
        flash[:success] = "Welcome, #{@user.github_username}! Please fill out some additional info about yourself."
      end
    else
      flash[:notice] = "Doesn't look like you are part of this organization. Please contact a staff person if you have questions."
      redirect_to root_path
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you later!'
    end
    redirect_to root_path
  end
  
  private
    # Is this an appropriate method name?
    def user_is_whitelisted(auth_hash)
      User.check_user_access(auth_hash)
    end
end