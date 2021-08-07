class Image
  attr_reader :description,
              :url,
              :source,
              :author

  def initialize(data)
    @description = data[:results][0][:description]
    @url = data[:results][0][:urls][:raw]
    @source = "Unsplash.com"
    @author = data[:results][0][:user][:name]
  end
end
