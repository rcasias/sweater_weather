require 'rails_helper'

RSpec.describe 'Current Weather Poros' do
  before :each do
    response = File.read('spec/fixtures/weather.json')
    data = JSON.parse(response, symbolize_names: true)
    @weather = CurrentWeather.new(data)
  end

  it 'can translate and find time for current day' do
    expect(@weather.strftime_datetime).to eq("2021-08-06 22:08:53-0600")
    expect(@weather.strftime_sunrise).to eq("2021-08-06 06:05:29-0600")
    expect(@weather.strftime_sunset).to eq("2021-08-06 20:03:07-0600")
  end

  it 'can access data for current day' do
    expect(@weather.temp).to eq(78.67)
    expect(@weather.feels).to eq(77.94)
    expect(@weather.humidity).to eq(36)
    expect(@weather.uvi).to eq(0)
    expect(@weather.visibility).to eq(10000)
    expect(@weather.description).to eq("clear sky")
    expect(@weather.icon).to eq("01n")
  end

end
