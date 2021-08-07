require 'rails_helper'

RSpec.describe 'Weather Request' do
  describe 'index' do
    it 'gets weather for a city - happy path keys' do
      get '/api/v1/forecast?location=Pueblo,CO'

      expect(response.status).to eq 200

      data = JSON.parse(response.body, symbolize_names: true)
      weather = data[:data]
      # binding.pry
      expect(weather[:type]).to eq 'forecast'

      att = weather[:attributes]

      expect(att).to have_key :current_weather
      expect(att).to have_key :daily_weather
      expect(att[:daily_weather]).to be_an Array
      expect(att).to have_key :hourly_weather
      expect(att[:hourly_weather]).to be_an Array
    end

    it 'has a sad path error page no city' do
      get '/api/v1/forecast?location=,CO'

      expect(response.status).to eq 404
    end

    it 'has a sad path error page no state' do
      get '/api/v1/forecast?location=Pueblo,'

      expect(response.status).to eq 404
    end

    it 'has a sad path error page no city or state' do
      get '/api/v1/forecast?location=,'

      expect(response.status).to eq 404
    end

    it 'has a sad path error page no location' do
      get '/api/v1/forecast?location=,'

      expect(response.status).to eq 404
    end

    it 'gets weather for a city - does not have un needed keys' do
      get '/api/v1/forecast?location=Pueblo,CO'

      expect(response.status).to eq 200

      data = JSON.parse(response.body, symbolize_names: true)
      weather = data[:data]
      # binding.pry
      expect(weather[:type]).to eq 'forecast'

      att = weather[:attributes]

      expect(att).to_not have_key :minutely
      expect(att).to_not have_key :lat
      expect(att).to_not have_key :lon
      expect(att).to_not have_key :timezone
      expect(att).to_not have_key :timezone_offset

      expect(att[:current_weather]).to_not have_key :pressure
      expect(att[:current_weather]).to_not have_key :dew_point
      expect(att[:current_weather]).to_not have_key :clouds
      expect(att[:current_weather]).to_not have_key :wind_speed
      expect(att[:current_weather]).to_not have_key :wind_deg

      expect(att[:hourly_weather][0]).to_not have_key :pressure
      expect(att[:hourly_weather][0]).to_not have_key :dew_point
      expect(att[:hourly_weather][0]).to_not have_key :clouds
      expect(att[:hourly_weather][0]).to_not have_key :wind_speed
      expect(att[:hourly_weather][0]).to_not have_key :wind_deg

      expect(att[:daily_weather][0]).to_not have_key :moonrise
      expect(att[:daily_weather][0]).to_not have_key :moonset
      expect(att[:daily_weather][0]).to_not have_key :moon_phase
      expect(att[:daily_weather][0]).to_not have_key :temp
      expect(att[:daily_weather][0]).to_not have_key :feels_like
      expect(att[:daily_weather][0]).to_not have_key :pressure
      expect(att[:daily_weather][0]).to_not have_key :dew_point
      expect(att[:daily_weather][0]).to_not have_key :clouds
      expect(att[:daily_weather][0]).to_not have_key :pop
      expect(att[:daily_weather][0]).to_not have_key :uvi
      expect(att[:daily_weather][0]).to_not have_key :wind_speed
      expect(att[:daily_weather][0]).to_not have_key :wind_deg
    end

  end
end
