class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :restaurant_api_id
      t.string :url
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :avg_cost_for_two
      t.integer :price_range
      t.float :avg_rating
      t.integer :votes
      t.string :phone_number
      t.integer :location_id
    end
  end
end
