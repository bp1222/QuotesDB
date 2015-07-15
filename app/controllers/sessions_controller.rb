class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.find_by(username: params[:username])
  	if user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		redirect_to login_path, {flash: {danger: "Unknown username or password"}}
  	end
  end

  def destroy
  	session[:user_id] = nil
  	reset_session
  	redirect_to root_path, {flash: {info: "You have been logged out"}}
  end
end