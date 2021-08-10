class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      # binding.pry
      # user_authenticated = UserSerializer.new(user)
      render json: UsersSerializer.new(user), status: :ok
    else
      render json: {
                    "message": "your query could not be completed",
                    "error": [
                      "invalid credentials"
                    ]
                    }, status: 404 and return
    end
  end
end
