require 'rails_helper'

RSpec.describe 'BreweryFacade' do
  it 'returns destination correctly', :vcr do
    data = BreweryFacade.new("Pueblo", "Co")
    # binding.pry
    expect(data.destination).to eq("Pueblo, Co")
  end

  it 'returns current forecast for location', :vcr do
    data = BreweryFacade.new("Pueblo", "Co")

    expect(data.forecast).to have_key :summary
    expect(data.forecast[:summary]).to eq("haze")
    expect(data.forecast).to have_key :tempurature
    expect(data.forecast[:tempurature]).to eq(87.28)
  end

  it 'returns breweries for location', :vcr do
    data = BreweryFacade.new("Pueblo", "Co")

    
  end
end
