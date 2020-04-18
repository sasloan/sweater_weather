class BackgroundService

  def location_background(location)
    location_background = conn.get("/v1/search?query=#{location}")
    get_json(location_background)
  end

  private 

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.pexels.com") do |faraday|
      faraday.headers["Authorization"] = ENV["PEXELS_API_KEY"]
    end
  end
end
