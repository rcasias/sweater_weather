class OpenBreweryApiService
  def self.get_breweries(lat, lon)
    response = Faraday.get("https://api.openbrewerydb.org/breweries?by_dist=#{lat},#{lon}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
