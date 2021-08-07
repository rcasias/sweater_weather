require 'rails_helper'

RSpec.describe 'UnsplashService' do
  it 'can get unsplash service', :vcr do
    service = UnsplashService.search("Denver, CO")

    expect(service).to have_key :results
    expect(service[:results]).to be_an Array

    data = service[:results][0]

    expect(data).to have_key :id
    expect(data).to have_key :created_at
    expect(data).to have_key :updated_at
    expect(data).to have_key :promoted_at
    expect(data).to have_key :width
    expect(data).to have_key :height
    expect(data).to have_key :color
    expect(data).to have_key :blur_hash
    expect(data).to have_key :description
    expect(data).to have_key :urls
    expect(data[:urls]).to be_a Hash
    expect(data[:urls]).to have_key :raw
    expect(data[:urls]).to have_key :full
    expect(data[:urls]).to have_key :regular
    expect(data[:urls]).to have_key :small
    expect(data[:urls]).to have_key :thumb
  end

end
