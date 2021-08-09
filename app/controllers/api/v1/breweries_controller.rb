class Api::V1::BreweriesController < ApplicationController

  def index
    location = params[:location]
    split_location = location.split(",")
    city = split_location[0]
    state = split_location[1]
    quantity = params[:quantity].to_i
    # binding.pry
    # binding.pry
    if location.nil? || city == "" || state.nil?
      render json: {
                    "message": "your query could not be completed",
                    "error": [
                      "please enter a location with city and state"
                    ]
                    }, status: 404 and return
    else
      # binding.pry
      current = BreweryFacade.new(city, state, quantity)
      render json: BrewerySerializer.new(current), status: :ok
    end
  rescue
    render json: {data:{}}, status: 404
  end

end
