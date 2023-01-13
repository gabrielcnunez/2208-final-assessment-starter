class PlacesService 
  def self.tourist_sights(lon, lat)
      response = conn.get("/v2/places?categories=tourism.sights&filter=circle:#{lon},#{lat},20000&bias=proximity:#{lon},#{lat}")
      require 'pry'; binding.pry
      JSON.parse(response.body,symbolize_names: true)
  end 

  def self.conn 
      Faraday.new("https://api.geoapify.com") do |f|
          f.headers["apiKey"] = ENV['places-api-key']
      end 
  end 
end 