class BrewerySerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination
  set_id { 'null' }
end
