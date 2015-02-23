class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @users = User.all

  end

  def new
    @user = User.new

  end

  def create
    @user = User.new
    if @user.save(user_params)
      redirect_to users_path, notice: "Yeah the user was created."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Updated like a fresh coat of paint."
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User was deleted my good sir"
  end

  def show

  end


private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :password, :about)
  end

end
