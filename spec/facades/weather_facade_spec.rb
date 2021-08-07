require 'rails_helper'

RSpec.describe 'WeatherFacade' do
  it 'returns current weather data correctly', :vcr do
    data = WeatherFacade.new("Pueblo", "Co")
    expect(data.current_weather.datetime).to eq("2021-08-07 13:03:53-0600")
    expect(data.current_weather.sunrise).to eq("2021-08-07 06:06:22-0600")
    expect(data.current_weather.sunset).to eq("2021-08-07 20:02:00-0600")
    expect(data.current_weather.description).to eq("clear sky")
    expect(data.current_weather.temp).to eq(89.01)
    expect(data.current_weather.icon).to eq("01d")
    expect(data.current_weather.uvi).to eq(9.81)
    expect(data.current_weather.visibility).to eq(10000)
    expect(data.current_weather.feels).to eq(86.13)
    expect(data.current_weather.humidity).to eq(26)
  end

  it 'returns hourly weather data correctly', :vcr do
    data = WeatherFacade.new("Pueblo", "Co")
    # binding.pry

    expect(data.hourly_weather.count).to eq(48)
    expect(data.hourly_weather.first.time).to eq("13:00:00")
    expect(data.hourly_weather.first.temp).to eq(89.24)
    expect(data.hourly_weather.first.conditions).to eq("clear sky")
    expect(data.hourly_weather.first.icon).to eq("01d")
  end

  # it 'returns daily weather correctly', :vcr do
  #   data = WeatherFacade.new("Pueblo", "Co")
  #   # binding.pry
  #   expect(data.count).to eq(8)
  #   expect(data.first.conditions).to eq("overcast clouds")
  #   expect(data.first.strftime_date).to eq("2021-08-14")
  #   expect(data.first.icon).to eq("04d")
  #   expect(data.first.max_temp).to eq(89.17)
  #   expect(data.first.min_temp).to eq(67.98)
  #   expect(data.first.strftime_sunrise).to eq("2021-08-14 06:12:37-0600")
  #   expect(data.first.strftime_sunset).to eq("2021-08-14 19:53:42-0600")
  # end
end
