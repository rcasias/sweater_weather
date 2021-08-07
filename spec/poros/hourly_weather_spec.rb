require 'rails_helper'

RSpec.describe 'Hourly Weather Poros' do
  before :each do
    response = File.read('spec/fixtures/weather.json')
    data = JSON.parse(response, symbolize_names: true)
    @weather = HourlyWeather.new(data, 1)
  end

  it 'can translate and find time for current day' do
    expect(@weather.strftime_time).to eq("22:00:00")
  end

  it 'can access data for current day' do
    expect(@weather.temp).to eq(78.67)
    expect(@weather.conditions).to eq("clear sky")
    expect(@weather.icon).to eq("01n")
  end

end
