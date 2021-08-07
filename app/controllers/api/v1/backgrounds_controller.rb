class Api::V1::BackgroundsController < ApplicationController

  def index
    location = params[:location]

    current = ImageFacade.new(location)
    render json: ImageSerializer.new(current), status: :ok

  end

end
