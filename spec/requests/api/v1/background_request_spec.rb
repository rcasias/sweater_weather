require 'rails_helper'

RSpec.describe 'Background Request' do
  describe 'index' do
    it 'gets weather for a city - happy path keys' do
      get '/api/v1/backgrounds?location=Pueblo,CO'

      expect(response.status).to eq 200

      data = JSON.parse(response.body, symbolize_names: true)
      image = data[:data]

      expect(image).to have_key :id
      expect(image).to have_key :type
      expect(image).to have_key :attributes
      expect(image[:attributes]).to have_key :image
      expect(image[:attributes][:image]).to have_key :description
      expect(image[:attributes][:image]).to have_key :url
      expect(image[:attributes]).to have_key :credit
      expect(image[:attributes][:credit]).to have_key :source
      expect(image[:attributes][:credit]).to have_key :author
    end

    it 'has a sad path error page no location' do
      get '/api/v1/backgrounds?location='

      expect(response.status).to eq 404
    end

  end
end
