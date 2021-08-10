class Api::V1::BackgroundsController < ApplicationController

  def index
    location = params[:location]
    if location.nil? || location == ""
      render json: {
                    "message": "your query could not be completed",
                    "error": [
                      "please enter a location"
                    ]
                    }, status: 404 and return
    else
      current = ImageFacade.new(location)
      render json: ImageSerializer.new(current), status: :ok
    end
  end

end
