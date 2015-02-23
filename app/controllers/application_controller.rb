class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by_id(session[:user_id])
  end

  def authenticate
    redirect_to login_path, alert: "Bro you can't visit that, unless you are logged in." unless current_user
  end

  helper_method :current_user

end
