class Category < ActiveRecord::Base
  belongs_to :category_restaurants
  has_many :restaurants, through: :category_restaurants
end
