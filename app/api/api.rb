require 'json'


class Api
  # result = NET::HTTP.get(URI.parse(""))

  def self.search
    json = JSON.parse(File.read('api/search.json'))
    json["restaurants"].each do |restaurant_obj|
      self.create_restaurant(restaurant_obj["restaurant"])
    end
    puts "#{Restaurant.all}"
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
    # restaurant_hash[:phone_number]

    restaurant = Restaurant.create(restaurant_hash)

    # location = Location.find_or_create_by(name: restaurant_obj["location"]["locality"])
    # restaurant.location = location

    restaurant.save
  end
end
Api.search
