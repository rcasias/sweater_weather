require 'rails_helper'

RSpec.describe 'RoadTripFacade' do
  it 'returns start and end city correctly', :vcr do
    data = RoadTripFacade.new("Pueblo", "Co", "Denver", "Co")

    expect(data.start_city).to eq("Pueblo, Co")
    expect(data.end_city).to eq("Denver, Co")
  end

  it 'returns time', :vcr do
    data = RoadTripFacade.new("Pueblo", "Co", "Denver", "Co")
    expect(data.travel_time).to eq("1 hour(s), 41 minute(s)")
  end

  it 'returns weather at destination', :vcr do
    data = RoadTripFacade.new("Pueblo", "Co", "Denver", "Co")

    expect(data.weather_at_eta).to have_key :tempurature
    expect(data.weather_at_eta[:tempurature]).to eq(88.95)
    expect(data.weather_at_eta).to have_key :conditions
    expect(data.weather_at_eta[:conditions]).to eq("clear sky")
  end
end
