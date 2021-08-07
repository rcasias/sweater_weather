require 'rails_helper'

RSpec.describe 'Weather Poros' do
  before :each do
    response = File.read('spec/fixtures/weather.json')
    data = JSON.parse(response, symbolize_names: true)
    @weather = Weather.new(data)
  end

  it 'can translate and find time for current day' do
    expect(@weather.strftime_current_time).to eq("2021-08-06 22:08:53-0600")
    expect(@weather.strftime_current_day_sunrise).to eq("2021-08-06 06:05:29-0600")
    expect(@weather.strftime_current_day_sunset).to eq("2021-08-06 20:03:07-0600")
  end

  it 'can access data for current day' do
    expect(@weather.current_day_temp).to eq(78.67)
    expect(@weather.current_day_feels).to eq(77.94)
    expect(@weather.current_day_humidity).to eq(36)
    expect(@weather.current_day_uvi).to eq(0)
    expect(@weather.current_day_visibility).to eq(10000)
    expect(@weather.current_day_description).to eq("clear sky")
    expect(@weather.current_day_icon).to eq("01n")
  end

end
