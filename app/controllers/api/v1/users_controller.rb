class Api::V1::UsersController < ApplicationController

  def index
    users =  User.all
    render json: UserSerializer.new(users)
  end


  def create
    binding.pry
    if params[:password] != params[:password_confirmation]
      render json: {
                    "message": "your query could not be completed",
                    "error": [
                      "passwords do not match"
                    ]
                    }, status: 404 and return
    else
      new_user = User.create!(user_params)
      render json: UserSerializer.new(new_user), status: :created
    end
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
