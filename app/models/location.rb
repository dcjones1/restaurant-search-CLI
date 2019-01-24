class Location < ActiveRecord::Base
  has_many :restaurants

  def nearby_restaurants(mile_radius)
    if self.latitude.nil? || self.longitude.nil?
      return []
    end

    Restaurant.all.select do |restaurant|
      if restaurant.latitude.nil? || restaurant.longitude.nil?
        next
      end

      distance = distance_between(self.latitude, self.longitude, restaurant.latitude, restaurant.longitude)
      distance <= mile_radius
    end
  end

  def nearby_locations(mile_radius)
    if self.latitude.nil? || self.longitude.nil?
      return []
    end

    Location.all.select do |location|
      distance = distance_between(self.latitude, self.longitude, location.latitude, location.longitude)
      location != self && distance <= mile_radius
    end
  end

  def self.highly_rated(location = "Capitol Hill")
    current_location = Location.find_by(title: "#{location}")
    current_location.restaurants.order(avg_rating: :DESC).limit(5)
  end
end
