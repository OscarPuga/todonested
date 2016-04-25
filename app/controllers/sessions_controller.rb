class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  
  
  def new
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]

    user = User.where(username: username).first
    if user.authenticate(password)
      session[:userid] = user.id
      flash[:notice] = "successfully logged"
      redirect_to root_path
    else
      flash[:alert] = "wrong password"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "successfully logged out"
    redirect_to login_path
  end
end
