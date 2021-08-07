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
    @datetime = Time.at(data[:current][:dt]).strftime('%Y-%m-%d %H:%M:%S%z')
    @sunrise = Time.at(data[:current][:sunrise]).strftime('%Y-%m-%d %H:%M:%S%z')
    @sunset = Time.at(data[:current][:sunset]).strftime('%Y-%m-%d %H:%M:%S%z')
    @temp = data[:current][:temp]
    @feels = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @uvi = data[:current][:uvi]
    @visibility = data[:current][:visibility]
    @description = data[:current][:weather][0][:description]
    @icon = data[:current][:weather][0][:icon]
  end

end
