require 'rails_helper'

RSpec.describe 'Directions Poros' do
  it 'can sort mapQuests Direction data' do
    response = File.read('spec/fixtures/directions.json')
    data = JSON.parse(response, symbolize_names: true)
    directions = Direction.new(data)

    expect(directions.travel_time).to eq("01:41:37")
  end
end
