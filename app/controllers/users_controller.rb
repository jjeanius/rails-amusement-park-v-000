require 'pry'

class UsersController < ApplicationController
   before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

def show
#  @user = User.find_by(id: params[:id])
  set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

    def edit
    end

    def update
      set_user
      @user.update(user_params)
      redirect_to user_path(@user)
    end

    private

    def set_user
      @user = User.find(params[:id])  #User callbacks to share common setup
    end

    def user_params
      params.require(:user).permit(
        :name,
        :nausea,
        :happiness,
        :height,
        :tickets,
        :password,
        :admin)
    end


end
