class WeatherService
  conn = Faraday.new(url: 'https://api.nal.usda.gov')


  def self.get_weather(lat, lon)
    response = Faraday.get("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{ENV['OpenWeather_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
