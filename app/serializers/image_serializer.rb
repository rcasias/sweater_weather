class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image, :credit
  set_id { 'null' }
end
