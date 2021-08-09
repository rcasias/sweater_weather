require 'rails_helper'

RSpec.describe 'Brewery Poros' do
  it 'can sort Brewery data' do
    response = File.read('spec/fixtures/image.json')
    data = JSON.parse(response, symbolize_names: true)
    image = Image.new(data)

    expect(image.description).to eq("Daybreak over downtown Denver with a view of the Rocky Mountains to the west")
    expect(image.url).to eq("https://images.unsplash.com/photo-1602800458591-eddda28a498b?ixid=MnwyNTIxNDF8MHwxfHNlYXJjaHwxfHxkZW52ZXJ8ZW58MHx8fHwxNjI4MzcxNjQ5&ixlib=rb-1.2.1")
    expect(image.source).to eq("Unsplash.com")
    expect(image.author).to eq("Andrew Coop")
  end
end
