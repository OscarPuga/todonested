class SessionsController < ApplicationController
  def new
  end

  def create
    username = params[:username]
    password = params[:password]
    user = User.where(username:"#{username}").first
    if user.authenticate("#{password}")
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
