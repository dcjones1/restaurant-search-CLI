class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :rating_api_id
      t.string :review_text
      t.string :rating_text
      t.timestamp :timestamp
      t.integer :restaurant_id
    end
  end
end
