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
    menu.choice "Name", 3
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

def print_restaurant(restaurant)
  puts "* #{restaurant.name}"
  restaurant.id
  # puts "* #{restaurant_object}"
end
