require 'rails_helper'

RSpec.describe 'WeatherService' do
  it 'can get weather service', :vcr do
    service = WeatherService.get_weather("38.265425", "-104.610415")
    data = service[:current]
    # binding.pry
    expect(data).to have_key(:dt)
    expect(data[:dt]).to eq(1628307333)
    expect(data).to have_key(:temp)
    expect(data[:temp]).to eq(81.43)

    daily = service[:daily]

    expect(daily).to be_an Array
    expect(daily.count).to eq(8)
    expect(daily[0]).to have_key(:temp)
    expect(daily[0][:temp]).to have_key(:day)
    expect(daily[0]).to have_key(:dt)
    expect(daily[0]).to have_key(:sunrise)
  end


end
