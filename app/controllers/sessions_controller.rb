class SessionsController < ApplicationController

  skip_before_action :require_login

  layout false

  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      @error = "No user with this email found"
      render :new
    else
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        @error = "Invalid password"
        render :new
      end
    end
  end

  def destroy

    reset_session
    redirect_to new_session_path
  end

end