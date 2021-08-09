require 'rails_helper'

RSpec.describe 'Brewery Request' do
  describe 'index' do
    it 'gets info for a city - happy path keys' do
      get '/api/v1/breweries?location=Pueblo,CO'

      expect(response.status).to eq 200

      data = JSON.parse(response.body, symbolize_names: true)
      brewery_info = data[:data]

      expect(brewery_info).to have_key :id
      expect(brewery_info).to have_key :type
      expect(brewery_info).to have_key :attributes

      brewery_info_attributes = brewery_info[:attributes]

      expect(brewery_info_attributes). to have_key :destination
      expect(brewery_info_attributes). to have_key :forecast
      expect(brewery_info_attributes). to have_key :breweries

      brewery_info_forecast = brewery_info_attributes[:forecast]

      expect(brewery_info_forecast).to have_key :summary
      expect(brewery_info_forecast).to have_key :tempurature

      brewery_store_info = brewery_info_attributes[:breweries].first

      expect(brewery_store_info).to have_key :id
      expect(brewery_store_info).to have_key :name
      expect(brewery_store_info).to have_key :brewery_type
    end

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
