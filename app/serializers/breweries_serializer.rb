class BreweriesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination, :forecast, :breweries
  set_id { 'null' }
end
