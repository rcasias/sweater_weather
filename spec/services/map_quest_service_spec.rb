require 'rails_helper'

RSpec.describe 'MapQuestService' do
  it 'returns mapquest service for current weather', :vcr do
    service = MapQuestService.get_location("pueblo", "co")
    data = service[:results][0][:locations][0]

    expect(data).to have_key(:adminArea5)
    expect(data[:adminArea5]).to eq("Pueblo")
    expect(data).to have_key(:adminArea3)
    expect(data[:adminArea3]).to eq("CO")
    expect(data).to have_key(:latLng)

    lat_lon = data[:latLng]

    expect(lat_lon).to have_key(:lat)
    expect(lat_lon[:lat]).to eq(38.265425)
    expect(lat_lon).to have_key(:lng)
    expect(lat_lon[:lng]).to eq(-104.610415)
  end
end
