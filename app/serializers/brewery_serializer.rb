class BrewerySerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination, :forecast
  set_id { 'null' }
end
