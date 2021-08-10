class MapQuestService
  def self.get_location(city, state)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV['MapQuest_API_KEY']}&location==#{city},#{state}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_directions(curr_city, curr_state, des_city, des_state)
    response = Faraday.get("http://www.mapquestapi.com/directions/v2/route?key=#{ENV['MapQuest_API_KEY']}&from=#{curr_city},#{curr_state}&to=#{des_city},#{des_state}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
