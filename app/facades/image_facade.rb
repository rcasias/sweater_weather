class ImageFacade
  attr_reader :credit,
              :image

  def initialize(location)
    @credit = self.get_picture_credits(location)
    @image = self.get_image(location)
  end

  def get_image(location)
    service = UnsplashService.search(location)
    {description: Image.new(service).description, url: Image.new(service).url}
  end


  def get_picture_credits(location)
    service = UnsplashService.search(location)
    {source: Image.new(service).source, author: Image.new(service).author}
  end


end
