class RoadTripFacade
  attr_reader :start_city
              :end_city

  def initialize(curr_city, curr_state, des_city, des_state)
    @start_city = "#{curr_city}, #{curr_state}"
    @end_city = "#{des_city}, #{end_state}" 
  end
end
