class Location < ActiveRecord::Base
  has_many :restaurants
  has_many :categories, through: :restaurants

  def category_names
    self.categories.map(&:name).uniq
  end

  def restaurants_with_category(category)
    self.restaurants.select do |restaurant|
      restaurant.categories.include?(category)
    end
  end

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

  def highly_rated
    self.restaurants.order(avg_rating: :DESC).limit(5)
  end
end
