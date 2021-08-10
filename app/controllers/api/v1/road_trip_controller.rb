class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if !user.nil?
      origin = params[:origin]
      destination = params[:destination]
      # binding.pry
      render json: RoadTripSerializer.new(origin), status: :ok
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
