require_relative '../config/environment.rb'
require_relative 'cli_methods.rb'

require 'colorize'

def runner(inputs = [])
  while true
    location = greeting
    if location.nil? || location.downcase.starts_with?('x')
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
          input = restaurant_menu

          case input
          when 1
            open_restaurant(restaurant)
          when 2
            call_restaurant(restaurant)
          when 3
            restaurant = list_restaurants(restaurant.nearby_restaurants)
            
            if restaurant.nil?   
              restaurant = list_restaurants(restaurant.nearby_restaurants(3))
            end

            if restaurant.nil?   
              restaurant = list_restaurants(restaurant.nearby_restaurants(5))
            end

            if restaurant.nil?   
              restaurant = list_restaurants(restaurant.nearby_restaurants(10))
            end

            show_restaurant(restaurant) if restaurant
          when 4
            # main_menu
          when 5
            break
          end
        end
      else
        puts "\nPlease enter a valid neighborhood".colorize(:yellow)
      end
    end
  end
end



runner
