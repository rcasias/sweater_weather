class HourlyWeather
  attr_reader :time,
              :temp,
              :conditions,
              :icon


  def initialize(data, hours)
    @time = data[:hourly][(hours - 1)][:dt]
    @temp = data[:hourly][(hours - 1)][:temp]
    @conditions = data[:hourly][(hours - 1)][:weather][0][:description]
    @icon = data[:hourly][(hours - 1)][:weather][0][:icon]
  end

  def strftime_time
    time = Time.at(@time)
    time.strftime('%H:%M:%S')
  end

end
