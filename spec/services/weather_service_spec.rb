require 'rails_helper'

RSpec.describe 'WeatherService' do
  it 'it can locate weather service', :vcr do
    service = WeatherService.get_weather("38.265425", "-104.610415")

    expect(service).to have_key(:dt)
    expect(service[:dt]).to eq(1628303053)
    expect(service).to have_key(:main)
    expect(service[:main]).to have_key(:temp)
    expect(service[:main][:temp]).to eq(302.21)
  end
end
