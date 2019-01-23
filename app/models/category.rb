class Category < ActiveRecord::Base
  has_many :category_restaurants
  has_many :restaurants, through: :category_restaurants
end
