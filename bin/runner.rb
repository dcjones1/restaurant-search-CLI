require_relative '../config/environment.rb'
require_relative 'cli_methods.rb'

def runner(inputs = [])
  while true
    location = greeting
    if location.downcase.starts_with?('x')
      puts "\n#{Location.all.map(&:title).join(", ")}\n\n"
    else
      location = Location.all.find do |locality|
        String::Similarity.levenshtein(locality.title, location) >= 0.3
      end
      if !location.nil?
        input = main_menu

        case input
        when 1
          restaurants = average_cost(location)
        when 2
          category = list_categories(location)
          restaurants = location.restaurants_with_category(category)
        when 3
          restaurant = find_restaurant()
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
      else
        puts "\nPlease enter a valid neighborhood"
      end
    end
  end
end

runner
