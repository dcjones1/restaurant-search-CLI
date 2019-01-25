require 'string/similarity'

class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :category_restaurants
  has_many :categories, through: :category_restaurants
  belongs_to :location

  def self.fuzzy_find(name)
    Restaurant.all.find do |restaurant|
      if String::Similarity.levenshtein(restaurant.name.downcase, name.downcase) >= 0.3
        return restaurant
      elsif restaurant.name.downcase.starts_with?(name.downcase)
        return restaurant
      elsif restaurant.name.downcase.ends_with?(name.downcase)
        return restaurant
      end
    end
  end

  def self.max_avg_cost(max)
    self.where('avg_cost_for_two <= ?', (max*2))
  end

  def self.min_avg_cost(min)
    self.where('avg_cost_for_two >= ?', (min*2))
  end

  def self.within_avg_cost(min, max)
    self.where('avg_cost_for_two >= ? and avg_cost_for_two <= ?', (min*2), (max*2))
  end

  # def self.where_category(category)
  #   self.where("categories = ?", category)
  # end

  def earliest_review
    self.reviews.min_by(&:timestamp)
  end

  def earliest_review_date
    # used to approximate restaurant age
    self.earliest_review.date
  end

  def nearby_restaurants(mile_radius = 1)
    Restaurant.all.select do |restaurant|
      if self == restaurant
        next
      elsif self.latitude.nil? || self.longitude.nil?
        next
      elsif restaurant.latitude.nil? || restaurant.longitude.nil?
        next
      end

      distance = distance_between(self.latitude, self.longitude, restaurant.latitude, restaurant.longitude)
      distance <= mile_radius
    end
  end
end
