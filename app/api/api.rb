require 'json'
require_relative '../api_key.rb'

class Api
  @url_array = [0, 20, 40, 60, 80]

  def self.search_restaurants
    @url_array.each do |url|
      uri = URI.parse("https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=#{url}")
      request = Net::HTTP::Get.new(uri)
      request["Accept"] = "application/json"
      request["User-Key"] = API_KEY

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

    restaurant_obj["cuisines"].split(", ").each do |cuisine|
      category = Category.find_or_create_by(name: cuisine)
      restaurant.categories << category
    end

    restaurant.save
  end

  def self.search_reviews
    restaurant_api_keys = Restaurant.all.map(&:restaurant_api_id)
    restaurant_api_keys.each do |key|
      uri = URI.parse("https://developers.zomato.com/api/v2.1/reviews?res_id=#{key}")
      request = Net::HTTP::Get.new(uri)
      request["Accept"] = "application/json"
      request["User-Key"] = API_KEY

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      json = JSON.parse(response.body)

      json["user_reviews"].each do |review_obj|
        self.create_review(review_obj["review"], key)
      end
    end
  end

  def self.create_review(review_obj, key)
    # creates Review instance
    review_hash = {}
    review_hash[:rating] = review_obj["rating"]
    review_hash[:rating_api_id] = review_obj["id"]
    review_hash[:review_text] = review_obj["review_text"]
    review_hash[:rating_text] = review_obj["rating_text"]
    review_hash[:timestamp] = review_obj["timestamp"]

    review_hash[:restaurant] = Restaurant.find_by(:restaurant_api_id => key)

    review = Review.find_or_create_by(review_hash)

    review.save
  end
end





# ["https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=0", "https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=20", "https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=40", "https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=60", "https://developers.zomato.com/api/v2.1/search?entity_type=city&q=Washington%2C%20DC&start=80"]
