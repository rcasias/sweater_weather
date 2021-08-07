class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temp,
              :feels,
              :humidity,
              :uvi,
              :visibility,
              :description,
              :icon

  def initialize(data)
    @datetime = data[:current][:dt]
    @sunrise = data[:current][:sunrise]
    @sunset = data[:current][:sunset]
    @temp = data[:current][:temp]
    @feels = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @description = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
  end

  def translate_time(time)
    time = Time.at(time)
    time.strftime('%Y-%m-%d %H:%M:%S%z')
  end

  def strftime_datetime
    translate_time(@datetime)
  end

  def strftime_sunrise
    translate_time(@sunrise)
  end

  def strftime_sunset
    translate_time(@sunset)
  end
end
