class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data, days)
    @date = Time.at(data[:daily][(days - 1)][:dt]).strftime('%Y-%m-%d')
    @sunrise = Time.at(data[:daily][(days - 1)][:sunrise]).strftime('%Y-%m-%d %H:%M:%S%z')
    @sunset = Time.at(data[:daily][(days - 1)][:sunset]).strftime('%Y-%m-%d %H:%M:%S%z')
    @max_temp = data[:daily][(days - 1)][:temp][:max]
    @min_temp = data[:daily][(days - 1)][:temp][:min]
    @conditions = data[:daily][(days - 1)][:weather][0][:description]
    @icon = data[:daily][(days - 1)][:weather][0][:icon]
  end

end
