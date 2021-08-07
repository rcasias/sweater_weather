class Weather
  attr_reader :current_time,
              :current_day_sunrise,
              :current_day_sunset,
              :current_day_temp,
              :current_day_feels,
              :current_day_humidity,
              :current_day_uvi,
              :current_day_visibility,
              :current_day_description,
              :current_day_icon

  def initialize(data)
    @current_time = data[:current][:dt]
    @current_day_sunrise = data[:current][:sunrise]
    @current_day_sunset = data[:current][:sunset]
    @current_day_temp = data[:current][:temp]
    @current_day_feels = data[:current][:feels_like]
    @current_day_humidity = data[:current][:humidity]
    @current_day_uvi = data[:current][:uvi]
    @current_day_visibility = data[:current][:visibility]
    @current_day_description = data[:current][:weather][0][:description]
    @current_day_icon = data[:current][:weather][0][:icon]
  end

  def translate_time(time)
    time = Time.at(time)
    time.strftime('%Y-%m-%d %H:%M:%S%z')
  end

  def strftime_current_time
    translate_time(@current_time)
  end

  def strftime_current_day_sunrise
    translate_time(@current_day_sunrise)
  end

  def strftime_current_day_sunset
    translate_time(@current_day_sunset)
  end
end
