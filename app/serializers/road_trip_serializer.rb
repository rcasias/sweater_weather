class RoadTripSerializer
    include FastJsonapi::ObjectSerializer
    attribute :origin, :destination
    set_id { 'null' }
end
