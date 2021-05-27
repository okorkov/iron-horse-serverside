class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      UserMailer.welcome_email(user, params[:user][:password]).deliver_now
      redirect_to admin_index_path
    else
      @error = 'There was an error creating account, try again'
      @admins = User.all
      @user = User.new
      render 'admin/index'
    end
  end

  def destroy
    User.find_by_id(params[:id]).destroy
    redirect_to admin_index_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end