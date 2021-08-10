class Api::V1::RoadTripController < ApplicationController

  def origin
    params[:origin]
  end

  def destination
    params[:destination]
  end

  def curr_city
    origin.split(",")[0]
  end

  def curr_state
    origin.split(",")[1]
  end

  def des_city
    destination.split(",")[0]
  end

  def des_state
    destination.split(",")[1]
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: {
                    "message": "your query could not be completed",
                    "error": [
                      "invalid credentials"
                    ]
                    }, status: 404 and return
    elsif curr_city == "" || curr_state.nil? || des_city == "" || des_state.nil?
      render json: {
                    "message": "your query could not be completed",
                    "error": [
                      "Invalid Enty: Please fill in origin and destination city and state"
                    ]
                    }, status: 404 and return
    else
      trip = RoadTripFacade.new(curr_city, curr_state, des_city, des_state)
      render json: RoadTripSerializer.new(trip), status: :ok
    end
  end
end
