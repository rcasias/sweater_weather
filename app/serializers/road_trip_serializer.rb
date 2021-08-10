class RoadTripSerializer
    include FastJsonapi::ObjectSerializer
     set_type :roadtrip
    attribute :start_city, :end_city, :travel_time, :weather_at_eta
    set_id { 'null' }
end
