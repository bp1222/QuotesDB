class UsersController < ApplicationController
  def index
    @users = User.order(username: :asc).page params[:page]
  end

  def register
    @user = User.new
  end

  def create
    require 'securerandom'
    @user = User.new user_params
    @user.auth_code = SecureRandom.hex(32)

    if @user.save
      UserMailer.new_user_registration(@user).deliver_now
      redirect_to users_path, {flash: {success: "An email has been sent to you to verify your account"}}
    else
      render 'register'
    end
  end

  def verify
    @user = User.find_by(auth_code: params[:auth_code])
    if @user
      @user.account_verified = true

      if @user.save
        flash[:success] = 'You have successfully verified your account and my now login'
        redirect_to root_path
      else
        flash[:notice] = 'We found your account to authorize, but were unable to authorize at this time'
        redirect_to root_path
      end
    else
      flash[:danger] = 'Could not verify your account'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
