class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data, days)
    @date = data[:daily][(days - 1)][:dt]
    @sunrise = data[:daily][(days - 1)][:sunrise]
    @sunset = data[:daily][(days - 1)][:sunset]
    @max_temp = data[:daily][(days - 1)][:temp][:max]
    @min_temp = data[:daily][(days - 1)][:temp][:min]
    @conditions = data[:daily][(days - 1)][:weather][0][:description]
    @icon = data[:daily][(days - 1)][:weather][0][:icon]
  end

  def translate_time(time)
    time = Time.at(time)
    time.strftime('%Y-%m-%d %H:%M:%S%z')
  end

  def strftime_date
    time = Time.at(@date)
    time.strftime('%Y-%m-%d')
  end

  def strftime_sunrise
    translate_time(@sunrise)
  end

  def strftime_sunset
    translate_time(@sunset)
  end
end
