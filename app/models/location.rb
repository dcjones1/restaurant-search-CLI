class Location < ActiveRecord::Base
  has_many :restaurants

  def nearby_restaurants(mile_radius)
    Restaurant.all.select do |restaurant|
      distance = distance_between(self.latitude, self.longitude, restaurant.latitude, restaurant.longitude)
      distance <= mile_radius
    end
  end

  def nearby_locations(mile_radius)
    Location.all.select do |location|
      distance = distance_between(self.latitude, self.longitude, location.latitude, location.longitude)
      distance <= mile_radius
    end
  end
end
