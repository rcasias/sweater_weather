require 'rails_helper'

RSpec.describe 'Daily Weather Poros' do
  before :each do
    response = File.read('spec/fixtures/weather.json')
    data = JSON.parse(response, symbolize_names: true)
    @weather = DailyWeather.new(data, 1)
    # binding.pry
  end

  it 'can translate and find time for current day' do
    expect(@weather.date).to eq("2021-08-07")
    expect(@weather.sunrise).to eq("2021-08-07 06:06:22-0600")
    expect(@weather.sunset).to eq("2021-08-07 20:02:00-0600")
  end

  it 'can access data for current day' do
    expect(@weather.max_temp).to eq(93.69)
    expect(@weather.min_temp).to eq(68.76)
    expect(@weather.conditions).to eq("clear sky")
    expect(@weather.icon).to eq("01d")
  end

end
