class Api::V1::UsersController < Api::V1::ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: %i[show update destroy]
  before_action :authenticate_request, except: [:create]

  def index
    @users = User.all
    render json: @users, only: %i[name email]
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, only: %i[name email]
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return if @user.update(user_params)

    render json: { errors: @user.errors.full_messages },
           status: :unprocessable_entity
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
