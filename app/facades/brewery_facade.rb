class BreweryFacade
  attr_reader :destination,
              :forecast,
              :breweries

  def initialize(city, state, quantity)
    @destination = self.get_destination(city, state, quantity)
    @forecast = self.get_forecast(city, state, quantity)
    @breweries = self.get_breweries(city, state, quantity)
  end

  def get_destination(city, state, quantity)
    "#{city}, #{state}"
  end

  def get_forecast(city, state, quantity)
    map = MapQuestFacade.location(city, state)
    weather = WeatherService.get_weather(map.lat, map.lon)
    current_weather = CurrentWeather.new(weather)
    {summary: current_weather.description, tempurature: current_weather.temp}
  end

  def get_breweries(city, state, quantity)
    map = MapQuestFacade.location(city, state)
    breweries = OpenBreweryApiService.get_breweries(map.lat, map.lon)
    brewery = breweries.map do |info|
      Brewery.new(info)
    end
    brewery.first(quantity)
  end
end
