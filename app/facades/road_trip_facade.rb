class RoadTripFacade
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(curr_city, curr_state, des_city, des_state)
    @start_city = "#{curr_city}, #{curr_state}"
    @end_city = "#{des_city}, #{des_state}"
    @travel_time = self.travel_time_hours_minutes(curr_city, curr_state, des_city, des_state)
    @weather_at_eta = self.get_weather(curr_city, curr_state, des_city, des_state)
  end

  def get_travel_time(curr_city, curr_state, des_city, des_state)
    service = MapQuestService.get_directions(curr_city, curr_state, des_city, des_state)
    time = Direction.new(service)
    time.travel_time
  end

  def travel_time_hours_minutes(curr_city, curr_state, des_city, des_state)
    time = get_travel_time(curr_city, curr_state, des_city, des_state)
    hours_minutes = time.split(":")
    if hours_minutes[0][0] == "0"
      hours_minutes[0] = hours_minutes[0][1]
    end
    "#{hours_minutes[0]} hour(s), #{hours_minutes[1]} minute(s)"
  end



  def get_weather(curr_city, curr_state, des_city, des_state)
    time = get_travel_time(curr_city, curr_state, des_city, des_state)
    hours = time.split(":")[0].to_i
    weather = WeatherFacade.new(des_city, des_state)
    {tempurature: weather.hourly_weather[hours].temp,
      conditions: weather.hourly_weather[hours].conditions}
  end

end
