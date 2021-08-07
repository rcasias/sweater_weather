class HourlyWeather
  attr_reader :time,
              :temp,
              :conditions,
              :icon


  def initialize(data, hours)
    @time = Time.at(data[:hourly][(hours)][:dt]).strftime('%H:%M:%S')
    @temp = data[:hourly][(hours)][:temp]
    @conditions = data[:hourly][(hours)][:weather][0][:description]
    @icon = data[:hourly][(hours)][:weather][0][:icon]
  end

end
