require 'rails_helper'

RSpec.describe 'Brewery Poros' do
  it 'can sort Brewery data' do
    response = File.read('spec/fixtures/brewery.json')
    data = JSON.parse(response, symbolize_names: true)
    
    brewery = data.map do |info|
      Brewery.new(info)
    end

    first = brewery.first

    expect(first.id).to eq(15563)
    expect(first.name).to eq("Walter Brewing Company")
    expect(first.brewery_type).to eq("micro")
  end
end
