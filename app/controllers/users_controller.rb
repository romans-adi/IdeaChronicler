class UsersController < ApplicationController
  def index
    @users = User.includes(:posts).all
    @user = current_user
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
