require_relative '../config/environment.rb'
require_relative 'cli_methods.rb'

def runner(inputs = [])
  while true
    location = greeting
    location = Location.find_by(title: location)
    input = main_menu
  
    case input
    when 1
      average_cost(location)
    when 2
      category = list_categories(location)
      restaurants = location.restaurants_with_category(category)
    when 3
      find_restaurant()
    end

    if restaurants.any?
      restaurant = list_restaurants(restaurants)
    end

    if restaurant
      show_restaurant(restaurant)
    end

    puts "\nDo you want to perform another search? (y/n)"

    input = inputs.shift || gets.chomp
    break if input.downcase.starts_with?('n')
  end
end


runner
