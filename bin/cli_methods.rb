require_relative '../config/environment.rb'
require_all 'app/models'

require 'colorize'
require 'launchy'

def opener
  a = Artii::Base.new :font => 'slant'
  puts "#{a.asciify('Restaurant Search')}"
end

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

def restaurant_menu
  prompt = TTY::Prompt.new
  prompt.select("What would you like to do now?") do |menu|
    menu.choice "Open Website", 1
    menu.choice "Call Restaurant", 2
    menu.choice "Find Nearby Restaurants", 3
    menu.choice "Main Menu", 4
    menu.choice "Exit", 5
  end
end

def average_cost(location)
  prompt = TTY::Prompt.new
  cost = prompt.ask("What's the maximum you'd like to pay per person?")
  restaurant_price = Restaurant.max_avg_cost(cost.to_i)
  restaurant_price.select {|rest| rest.location == location}
end

def find_restaurant
  prompt = TTY::Prompt.new
  name = prompt.ask("Please enter the name of the restaurant:")
  Restaurant.fuzzy_find(name)
end

def list_categories(location)
  return if location.categories.empty?

  items = []
  location.categories.uniq.each do |category|
    items << {name: category.name, value: category.id}
  end

  prompt = TTY::Prompt.new
  category_id = prompt.select("Please Select a Category", items, filter: true)
  Category.find(category_id)
end

def list_restaurants(restaurants)
  return if restaurants.empty?

  items = []
  restaurants.each do |restaurant|
    items << {name: restaurant.name, value: restaurant.id}
  end

  prompt = TTY::Prompt.new
  restaurant_id = prompt.select("Please Select a Restaurant", items, filter: true)
  Restaurant.find(restaurant_id)
end

def show_restaurant(restaurant)
  puts "\nName: ".colorize(:blue) + "#{restaurant.name}"
  puts "Address: ".colorize(:blue) + "#{restaurant.address}"
  puts "Rating: ".colorize(:blue) + "#{restaurant.avg_rating}"
  puts "URL: ".colorize(:blue) + "#{restaurant.url}\n\n"
end

def open_restaurant(restaurant)
  if restaurant.url.nil? || restaurant.url.empty?
    puts "No URL exists for restaurant"
  else
    Launchy.open(restaurant.url)
  end
end

def call_restaurant(restaurant)
  if restaurant.phone_number.nil?
    puts "No phone number exists for restaurant"
  else
    Launchy.open("tel://#{restaurant.phone_number}")
  end
end
