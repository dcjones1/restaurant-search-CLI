class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :categories, through: :category_restaurants
  belongs_to :location

end
