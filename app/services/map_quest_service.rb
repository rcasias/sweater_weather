class MapQuestService
  def self.get_location(city, state)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['MapQuest_API_KEY']}&location==#{city},#{state}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
