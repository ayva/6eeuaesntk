class UsersController < ApplicationController
  before_action :require_login, :except => [:new, :create]
  before_action :require_current_user, :only => [:edit, :update, :destroy]
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)  
      flash[:success] = "Welcome, new user!"
      redirect_to @user
    else
      flash.now[:error] = "Something went wrong."
      render :new
    end
  end

  def update
    if current_user.update(whitelisted_user_params)  # <<<<<
      flash[:success] = "Successfully updated your profile"
      redirect_to current_user
    else
      flash.now[:failure] = "Failed to update your profile"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email,:password,
              :password_confirmation)
  end
end
