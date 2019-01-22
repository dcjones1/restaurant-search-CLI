class CategoryRestaurants < ActiveRecord::Base
  has_many :categories
  has_many :restaurants

end
