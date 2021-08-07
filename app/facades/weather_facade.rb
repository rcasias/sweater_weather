class WeatherFacade
  def self.current_weather(city, state)
    map = MapQuestFacade.location(city, state)
    weather = WeatherService.get_weather(map.lat, map.lon)
    CurrentWeather.new(weather)
  end

  def self.hourly_weather(city, state)
    map = MapQuestFacade.location(city, state)
    weather = WeatherService.get_weather(map.lat, map.lon)
    count = 0
    hourly_weather_listed = weather[:hourly].map do |hour|
      HourlyWeather.new(weather, count)
    end
    count + 1
    hourly_weather_listed
  end

  def self.daily_weather(city, state)
    map = MapQuestFacade.location(city, state)
    weather = WeatherService.get_weather(map.lat, map.lon)
    count = 0
    daily_weather_listed = weather[:daily].map do |hour|
      DailyWeather.new(weather, count)
    end
    count + 1
    daily_weather_listed
  end
end
