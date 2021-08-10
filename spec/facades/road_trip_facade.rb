require 'rails_helper'

RSpec.describe 'RoadTripFacade' do
  it 'returns start and end city correctly', :vcr do
    data = RoadTripFacade.new("Pueblo", "Co", "Denver", "Co")

    expect(data.start_city).to eq("Pueblo, Co")
    expect(data.start_city).to eq("Denver, Co")
  end
end
