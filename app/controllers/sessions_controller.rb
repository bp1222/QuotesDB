class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.find_by(username: params[:username])

    redirect_to login_path, {flash: {danger: 'Unknown username or password'}} and return unless user

  	if user.authenticate(params[:password])
      redirect_to login_path, {flash: {danger: 'Account not verified'}} and return unless user.account_verified

  		session[:user_id] = user.id
  		redirect_to root_path and return
  	else
  		redirect_to login_path, {flash: {danger: "Unknown username or password"}} and return
  	end
  end

  def destroy
  	session[:user_id] = nil
  	reset_session
  	redirect_to root_path, {flash: {info: "You have been logged out"}} and return
  end
end