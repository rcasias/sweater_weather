class Api::V1::UsersController < ApplicationController

  def index
    users =  User.all
    render json: UsersSerializer.new(users)
  end


  def create
    if params[:password] != params[:password_confirmation]
      render json: {
                    "message": "your query could not be completed",
                    "error": [
                      "passwords do not match"
                    ]
                    }, status: 404 and return
    else
      new_user = User.create!(user_params)
      render json: UsersSerializer.new(new_user), status: :created
    end
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
