class CreateCategoryRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :category_restaurants do |t|
      t.integer :restaurant_id
      t.integer :category_id
    end
  end
end
