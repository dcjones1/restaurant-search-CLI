require_relative '../config/environment.rb'
require_all 'app/models'

def greeting
  prompt = TTY::Prompt.new
  prompt.ask("Please enter a location (Either neighborhood or press x for a list of neighborhoods)")
end

def main_menu(input = nil)
  prompt = TTY::Prompt.new
  prompt.select("How would you like to search for a restaurant?") do |menu|
    menu.choice "Nearby", 1
    menu.choice "Highly Rated", 2
    menu.choice "Category", 3
  end
end

def list_nearby(location, mile_radius = 3)
  restaurants = location.nearby_restaurants(mile_radius)
  restaurants.each do |restaurant|
    print_restaurant(restaurant)
  end
end

def list_highly_rated(location)
  restaurants = location.highly_rated
  restaurants.each do |restaurant|
    print_restaurant(restaurant)
  end
end

def print_restaurant(restaurant)
  puts "* #{restaurant.name}"
  restaurant.id
  # puts "* #{restaurant_object}"
end
