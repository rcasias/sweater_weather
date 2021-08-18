require 'rails_helper'

RSpec.describe 'Hourly Weather Poros' do
  before :each do
    response = File.read('spec/fixtures/weather.json')
    data = JSON.parse(response, symbolize_names: true)
    @weather = HourlyWeather.new(data, 1)
  end

  xit 'can translate and find time for current day' do
    expect(@weather.time).to eq("23:00:00")
  end

  it 'can access data for current day' do
    expect(@weather.temp).to eq(77.4)
    expect(@weather.conditions).to eq("few clouds")
    expect(@weather.icon).to eq("02n")
  end

end
