class Api::V1::UsersController < ApplicationController

  def index
    users =  User.all
    render json: UserSerializer.new(users)
  end


  def create
    new_user = User.create(user_params)
    render json: UserSerializer.new(new_user), status: :created
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confiramtion)
  end
end
