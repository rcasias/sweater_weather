class BreweryFacade
  attr_reader :destination,
              :forecast,
              :breweries

  def initialize(city, state)
    @destination = self.get_destination(city, state)
    @forecast = self.get_forecast(city, state)
    # @breweries = self.get_breweries(city, state)
  end

  def get_destination(city, state)
    "#{city}, #{state}"
  end

  def get_forecast(city, state)
    map = MapQuestFacade.location(city, state)
    weather = WeatherService.get_weather(map.lat, map.lon)
    current_weather = CurrentWeather.new(weather)
    {summary: current_weather.description, tempurature: current_weather.temp}
  end


end
