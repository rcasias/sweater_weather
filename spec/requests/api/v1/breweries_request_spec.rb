require 'rails_helper'

RSpec.describe 'Brewery Request' do
  describe 'index' do
    # it 'gets info for a city - happy path keys' do
    #   get '/api/v1/breweries?location=Pueblo,CO'
    #
    #   expect(response.status).to eq 200
    #
    #   data = JSON.parse(response.body, symbolize_names: true)
    #   weather = data[:data]
    #   # binding.pry
    #   expect(weather[:type]).to eq 'forecast'
    #
    #   att = weather[:attributes]
    #
    #   expect(att).to have_key :current_weather
    #   expect(att).to have_key :daily_weather
    #   expect(att[:daily_weather]).to be_an Array
    #   expect(att).to have_key :hourly_weather
    #   expect(att[:hourly_weather]).to be_an Array
    # end

    it 'has a sad path error page no city' do
      get '/api/v1/breweries?location=,CO'

      expect(response.status).to eq 404
    end

    it 'has a sad path error page no state' do
      get '/api/v1/breweries?location=Pueblo,'

      expect(response.status).to eq 404
    end

    it 'has a sad path error page no city or state' do
      get '/api/v1/breweries?location=,'

      expect(response.status).to eq 404
    end

    it 'has a sad path error page no location' do
      get '/api/v1/breweries?location=,'

      expect(response.status).to eq 404
    end

    it 'has a sad path execption page no quantity' do
      get '/api/v1/breweries?location=pueblo,co'

      expect(response.status).to eq 200

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data][:attributes][:breweries].count).to eq(5)
    end

    it 'has a sad path execption page no quantity number listed' do
      get '/api/v1/breweries?location=pueblo,co&quantity='

      expect(response.status).to eq 200

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data][:attributes][:breweries].count).to eq(5)
    end

    it 'has a sad path execption page quantity less than 0' do
      get '/api/v1/breweries?location=pueblo,co&quantity=-1'

      expect(response.status).to eq 200

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data][:attributes][:breweries].count).to eq(5)
    end

    it 'has a sad path execption page quantity 0' do
      get '/api/v1/breweries?location=pueblo,co&quantity=0'

      expect(response.status).to eq 200

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data][:attributes][:breweries].count).to eq(5)
    end


  end
end
