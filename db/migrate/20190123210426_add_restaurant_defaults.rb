class AddRestaurantDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_default :restaurants, :avg_cost_for_two, 0
    change_column_default :restaurants, :avg_rating, 0
    change_column_default :restaurants, :votes, 0
  end
end
