require 'rails_helper'

RSpec.describe 'OpenBreweryApiService' do
  it 'can get brewery service', :vcr do
    service = OpenBreweryApiService.get_breweries("38.265425", "-104.610415")

    expect(service).to be_an Array
    first = service[0]

    expect(first).to have_key :id
    expect(first).to have_key :name
    expect(first).to have_key :brewery_type
  end

end
