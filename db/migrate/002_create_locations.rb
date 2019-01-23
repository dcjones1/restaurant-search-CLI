class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.string :city_name
      t.integer :city_id
      t.string :country_name
    end
  end
end
