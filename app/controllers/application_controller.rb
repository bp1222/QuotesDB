class ApplicationController < ActionController::Base
  helper ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_auth
  	if !authorized?
  		redirect_to root_path, {flash: {notice: "You are not authorized"}}
  	end
  end

  def get_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def authorized?
    get_current_user != nil
  end
  helper_method :authorized?
end
