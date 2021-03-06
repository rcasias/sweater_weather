class Api::V1::ForecastController < ApplicationController

  def index
    location = params[:location]
    split_location = location.split(",")
    city = split_location[0]
    state = split_location[1]
    # binding.pry
    if location.nil? || city == "" || state.nil?
      render json: {
                    "message": "your query could not be completed",
                    "error": [
                      "please enter a location with city and state"
                    ]
                    }, status: 404 and return
    else
      current = WeatherFacade.new(city, state)
      render json: ForecastSerializer.new(current), status: :ok
    end
  end

end
