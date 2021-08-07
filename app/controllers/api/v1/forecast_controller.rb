class Api::V1::ForecastController < ApplicationController

  def index
    location = params[:location]
    split_location = location.split(",")
    city = split_location[0]
    state = split_location[1]
    # binding.pry
    if location.nil? || city == "" || state.nil?
      render json: {data:{}}, status: 404
    else
      current = WeatherFacade.new(city, state)
      render json: ForecastSerializer.new(current), status: :ok
    end
  rescue
    render json: {data:{}}, status: 404
  end

end
