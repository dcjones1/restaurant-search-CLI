class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :category_restaurants
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

  def self.max_avg_cost(max)
    self.where('avg_cost_for_two <= ?', max)
  end

  def self.min_avg_cost(min)
    self.where('avg_cost_for_two >= ?', min)
  end

  def self.within_avg_cost(min, max)
    self.where('avg_cost_for_two >= ? and avg_cost_for_two <= ?', min, max)
  end

  def where_category(category)
    # filter by category
  end

  def earliest_review
    self.reviews.min_by(&:timestamp)
  end

  def earliest_review_date
    # used to approximate restaurant age
    self.earliest_review.date
  end

  def aggregate_rating
    begin
      rating = self.avg_rating / self.votes
    rescue ZeroDivisionError
      rating = 0
    end

    rating = 0 if rating.nan?
    return rating
  end

  def nearby_restaurants
    # could use `/search` api for propery geolocation
    # simple implementation could search by lat/long range
    # e.g. abs(lat1 - lat2) <= 0.0001
  end
end
