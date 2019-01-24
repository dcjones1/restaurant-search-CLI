require_relative '../config/environment.rb'
require_all 'app/models'

def greeting
  prompt = TTY::Prompt.new
  prompt.ask("Please enter a location: (Either neighborhood or press x for a list of neighborhoods)")
end

def main_menu(input = nil)
  prompt = TTY::Prompt.new
  prompt.select("How would you like to search for a restaurant?") do |menu|
    menu.choice "Average Cost", 1
    menu.choice "Category", 2
<<<<<<< HEAD
    menu.choice "Name", 3
=======
    menu.choice "Name"
>>>>>>> add select by category
  end
end

def average_cost(location)
  prompt = TTY::Prompt.new
  cost = prompt.ask("What's the maximum you'd like to pay?")
  restaurant_price = Restaurant.max_avg_cost(cost.to_i)
  restaurant_location =restaurant_price.select {|rest| rest.location == location}
  puts "#{restaurant_location.map(&:name)}"
end

def find_restaurant
  prompt = TTY::Prompt.new
  name = prompt.ask("Please enter the name of the restaurant:")
  restaurant = Restaurant.all.find_by(name: name)
  puts "\n#{restaurant.name}\n#{restaurant.address}"
end

def list_categories(location)
  items = []
  location.categories.uniq.each do |category|
    items << {name: category.name, value: category.id}
  end

  prompt = TTY::Prompt.new
  category_id = prompt.select("Please Select a Category", items, filter: true)
  Category.find(category_id)
end

def list_restaurants(restaurants)
  items = []
  restaurants.each do |restaurant|
    items << {name: print_restaurant(restaurant), value: restaurant.id}
  end

  prompt = TTY::Prompt.new
  restaurant_id = prompt.select("Please Select a Restaurant", items, filter: true)
  Restaurant.find(restaurant_id)
end

def print_restaurant(restaurant)
  # return "#{restaurant.name} - #{restaurant.category.name} - #{restaurant.avg_rating}"
  return restaurant.name
end

def show_restaurant(restaurant)
  puts "Name: #{restaurant.name}"
  puts "Address: #{restaurant.address}"
  puts "URL: #{restaurant.url}"
end
