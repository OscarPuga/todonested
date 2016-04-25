class ApplicationController < ActionController::Base
  helper_method :logged_in? :current_user
  before_action :ensure_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def logged_in?
    return session[:userid].present?
  end
  
  def current_user
    return Users.find(session[:userid]) if logged_in?
  end

  def ensure_login
    redirect_to root_path if !logged_in?
  end
  
end
