class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if !user.nil?
      origin = params[:origin]
      destination = params[:destination]

      curr_city = origin.split(",")[0]
      curr_state = origin.split(",")[1]

      des_city = destination.split(",")[0]
      des_state = destination.split(",")[1]

      trip = RoadTripFacade.new(curr_city, curr_state, des_city, des_state)
      render json: RoadTripSerializer.new(trip), status: :ok
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
