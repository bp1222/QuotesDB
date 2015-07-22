class ApplicationController < ActionController::Base
  helper ApplicationHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def has_right?(has_right)
    return false unless session[:user_id]
    User.find(session[:user_id]).roles.any? do |role|
      role.rights.any? do |right|
        right.right_name == 'admin' || right.right_name = has_right
      end
    end
  end
  helper_method :has_right?
end
