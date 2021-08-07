require 'rails_helper'

RSpec.describe 'WeatherFacade' do
  it 'returns current weather data correctly', :vcr do
    data = WeatherFacade.current_weather("Pueblo", "Co")

    expect(data.strftime_datetime).to eq("2021-08-07 10:06:55-0600")
    expect(data.strftime_sunrise).to eq("2021-08-07 06:06:22-0600")
    expect(data.strftime_sunset).to eq("2021-08-07 20:02:00-0600")
    expect(data.description).to eq("clear sky")
    expect(data.temp).to eq(81.19)
    expect(data.icon).to eq("01d")
    expect(data.uvi).to eq(4.95)
    expect(data.visibility).to eq(10000)
    expect(data.feels).to eq(80.6)
    expect(data.humidity).to eq(38)
  end

  it 'returns hourly weather data correctly', :vcr do
    data = WeatherFacade.hourly_weather("Pueblo", "Co")

    expect(data.count).to eq(48)
    expect(data.first.strftime_time).to eq("10:00:00")
    expect(data.first.temp).to eq(83.35)
    expect(data.first.conditions).to eq("clear sky")
    expect(data.first.icon).to eq("01d")
  end

  it 'returns daily weather correctly', :vcr do
    data = WeatherFacade.daily_weather("Pueblo", "Co")
    # binding.pry
    expect(data.count).to eq(8)
    expect(data.first.conditions).to eq("overcast clouds")
    expect(data.first.strftime_date).to eq("2021-08-14")
    expect(data.first.icon).to eq("04d")
    expect(data.first.max_temp).to eq(89.17)
    expect(data.first.min_temp).to eq(67.98)
    expect(data.first.strftime_sunrise).to eq("2021-08-14 06:12:37-0600")
    expect(data.first.strftime_sunset).to eq("2021-08-14 19:53:42-0600")
  end
end
