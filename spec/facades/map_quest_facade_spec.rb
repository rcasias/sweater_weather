require 'rails_helper'

RSpec.describe 'MapQuestFacade' do
  it 'returns MapQuest data correctly', :vcr do
    data = MapQuestFacade.location("Pueblo", "Co")
    
    expect(data).to be_a MapQuest
    expect(data.lat).to eq(38.265425)
    expect(data.lon).to eq(-104.610415)
  end
end
