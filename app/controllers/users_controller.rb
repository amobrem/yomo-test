class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render json: { errors:['The object you tried to access does not exist']}
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
