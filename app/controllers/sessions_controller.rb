class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Week 7 and you are still here!"
    else
      flash[:login_alert] = "Username / password combination is invalid, stop trying to hack"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "Logged out eh? Cya mate!"
  end

end
