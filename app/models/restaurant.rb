class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :categories, through: :category_restaurants
  belongs_to :location

  def self.max_price_range(max)
    self.where('price_range <= ?', max)
  end

  def self.min_price_range(min)
    self.where('price_range >= ?', min)
  end

  def self.within_price_range(min, max)
    self.where('price_range >= ? and price_range <= ?', min, max)
  end

  def where_category(category)
    # filter by category
  end

  def earliest_review
    # find earliest review, based on timestamp
    # used to determine restaurant age
  end

  def aggregate_rating
    # separate from average rating
    # incorporates review ratings & vote count
  end

  def nearby_restaurants
    # could use `/search` api for propery geolocation
    # simple implementation could search by lat/long range
    # e.g. abs(lat1 - lat2) <= 0.0001
  end

  def max_avg_cost(max)
    # filter restaurants where avg cost <= max
  end

  def min_avg_cost(min)
    # filter restaurants where avg cost >= min
  end
end
