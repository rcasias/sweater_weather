class UnsplashService
  def self.search(location)
    response = Faraday.get("https://api.unsplash.com/search/photos?page=1&query=#{location}&client_id=#{ENV['Unsplash_API_KEY']}") 
    JSON.parse(response.body, symbolize_names: true)
  end
end
