require 'rails_helper'

RSpec.describe 'Current Weather Poros' do
  before :each do
    response = File.read('spec/fixtures/weather.json')
    data = JSON.parse(response, symbolize_names: true)
    @weather = DailyWeather.new(data, 1)
    # binding.pry
  end

  it 'can translate and find time for current day' do
    expect(@weather.strftime_datetime).to eq("2021-08-06 13:00:00-0600")
    expect(@weather.strftime_sunrise).to eq("2021-08-06 06:05:29-0600")
    expect(@weather.strftime_sunset).to eq("2021-08-06 20:03:07-0600")
  end

  it 'can access data for current day' do
    expect(@weather.max_temp).to eq(98.91)
    expect(@weather.min_temp).to eq(70.47)
    expect(@weather.conditions).to eq("clear sky")
    expect(@weather.icon).to eq("01d")
  end

end
