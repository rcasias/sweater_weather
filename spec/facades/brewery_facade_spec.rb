require 'rails_helper'

RSpec.describe 'BreweryFacade' do
  it 'returns destination correctly', :vcr do
    data = BreweryFacade.new("Pueblo", "Co", 5)

    expect(data.destination).to eq("Pueblo, Co")
  end

  it 'returns current forecast for location', :vcr do
    data = BreweryFacade.new("Pueblo", "Co", 5)

    expect(data.forecast).to have_key :summary
    expect(data.forecast[:summary]).to eq("haze")
    expect(data.forecast).to have_key :tempurature
    expect(data.forecast[:tempurature]).to eq("87.66 F")
  end

  it 'returns breweries for location', :vcr do
    data = BreweryFacade.new("Pueblo", "Co", 10)

    expect(data.breweries).to be_an Array
    expect(data.breweries.count).to eq(10)

    first = data.breweries.first

    expect(first.id).to eq(15563)
    expect(first.name).to eq("Walter Brewing Company")
    expect(first.brewery_type).to eq("micro")
  end
end
