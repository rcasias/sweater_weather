require 'rails_helper'

RSpec.describe 'BreweryFacade' do
  it 'returns destination correctly', :vcr do
    data = BreweryFacade.new("Pueblo", "Co")
    # binding.pry
    expect(data.destination).to eq("Pueblo, Co")
  end
end
