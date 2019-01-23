require 'json'

class Api
  # result = NET::HTTP.get(URI.parse(""))
  @url_array = ["https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=0", "https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=20", "https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=40", "https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=60", "https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=80"]

  def self.search_restaurants
    @url_array.each do |url|
      uri = URI.parse(url)
      request = Net::HTTP::Get.new(uri)
      request["Accept"] = "application/json"
      request["User-Key"] = "9daaa0c13ba2bd8f5234edfba454204d"

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      json = JSON.parse(response.body)

      json["restaurants"].each do |restaurant_obj|
        self.create_restaurant(restaurant_obj["restaurant"])
      end
    end
  end

  def self.create_restaurant(restaurant_obj)
    # creates Restaurant instance
    restaurant_hash = {}
    restaurant_hash[:name] = restaurant_obj["name"]
    restaurant_hash[:restaurant_api_id] = restaurant_obj["id"]
    restaurant_hash[:url] = restaurant_obj["url"]
    restaurant_hash[:address] = restaurant_obj["location"]["address"]
    restaurant_hash[:latitude] = restaurant_obj["location"]["latitude"]
    restaurant_hash[:longitude] = restaurant_obj["location"]["longitude"]
    restaurant_hash[:avg_cost_for_two] = restaurant_obj["average_cost_for_two"]
    restaurant_hash[:price_range] = restaurant_obj["price_range"]
    restaurant_hash[:avg_rating] = restaurant_obj["user_rating"]["aggregate_rating"]
    restaurant_hash[:votes] = restaurant_obj["user_rating"]["votes"]

    restaurant = Restaurant.find_or_create_by(restaurant_hash)

    location = Location.find_or_create_by(title: restaurant_obj["location"]["locality"])
    restaurant.location = location

    restaurant.save
  end
end
