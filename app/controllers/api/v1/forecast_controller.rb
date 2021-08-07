class Api::V1::ForecastController < ApplicationController

  def index
    location = params[:location]
    split_location = location.split(",")
    city = split_location[0]
    state = split_location[1]
    current = WeatherFacade.new(city, state)
    render json: ForecastSerializer.new(current)
  end

end
