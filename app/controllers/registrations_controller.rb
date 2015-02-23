class RegistrationsController < ApplicationController

  def new
    @registration = User.new
  end

  def create
    @registration = User.new(registration_params)
    if @registration.save
      session[:user_id] = @registration.id
      redirect_to users_path, notice: "You successfully registered."
    else
      render :new
    end
  end

  def destroy
    @registration = User.find(params[:id])
    if @registration.destroy
      redirect_to users_path, notice: "You deleted that user, interesting."
    end
  end

private
  def registration_params
    params.require(:user).permit(:user_name, :password)
  end

end
