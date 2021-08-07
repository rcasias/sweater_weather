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
    list = []
    count = 0
    weather[:hourly].map do |hour|
      list << HourlyWeather.new(weather, count)
      count += 1
    end
    list
  end

  def daily(city, state)
    map = MapQuestFacade.location(city, state)
    weather = WeatherService.get_weather(map.lat, map.lon)
    list = []
    count = 0
    weather[:daily].each do |day|
      list << DailyWeather.new(weather, count)
      count += 1
    end
    list
  end
end
