require 'rails_helper'

RSpec.describe 'ImageFacade' do
  it 'returns Unsplash data correctly', :vcr do
    data = ImageFacade.new("Pueblo, Co")

    expect(data.credit).to have_key :source
    expect(data.credit[:source]).to eq("Unsplash.com")
    expect(data.credit).to have_key :author

    expect(data.image).to have_key :description
    expect(data.image).to have_key :url
  end
end
