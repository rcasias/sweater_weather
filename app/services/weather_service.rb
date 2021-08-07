class WeatherService
  def self.get_weather(lat, lon)
    response = Faraday.get("http://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&units=imperial&appid=#{ENV['OpenWeather_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
