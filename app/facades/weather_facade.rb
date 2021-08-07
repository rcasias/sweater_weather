class WeatherFacade
  attr_reader :current_weather,
              :hourly_weather,
              :daily_weather

  def initialize(city, state)
    @current_weather = self.current(city, state)
    @hourly_weather = self.hourly(city, state)
    @daily_weather = self.daily(city, state)
  end

  def current(city, state)
    map = MapQuestFacade.location(city, state)
    weather = WeatherService.get_weather(map.lat, map.lon)
    CurrentWeather.new(weather)
  end

  def hourly(city, state)
    map = MapQuestFacade.location(city, state)
    weather = WeatherService.get_weather(map.lat, map.lon)
    count = 0
    hourly_weather_listed = weather[:hourly].map do |hour|
      HourlyWeather.new(weather, count)
    end
    count + 1
    hourly_weather_listed
  end

  def daily(city, state)
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
