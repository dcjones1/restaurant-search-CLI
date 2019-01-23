require_relative '../config/environment.rb'
require_all 'app/models'

def greeting
  puts "\nPlease Enter a Location (Either Location Name or Lat/Long):"
end

def main_menu(input = nil)
  puts <<-OUT
1) Nearby (w/in 3 miles)
2) New
3) Highly Rated
  OUT
  input || gets.chomp
end

def list_nearby
  # perform db `/search` based on location lat/long
  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    print_restaurant(restaurant)
  end
end

def list_new
  # perform db `/search` based on number of reviews/maybe timestamp
  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    print_restaurant(restaurant)
  end
end

def list_highly_rated
  # perform db `/search` based on avg reviews
  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    print_restaurant(restaurant)
  end
end

def print_restaurant(restaurant)
  puts "* #{restaurant.name}"
  # puts "* #{restaurant_object}"   #human-readable hash??
end

def runner(inputs = [])
  while true
    greeting
    input = main_menu(inputs.shift)

    case input
    when "1"
      list_nearby
    when "2"
      list_new
    when "3"
      list_highly_rated
    end

    puts "\nDo you want to perform another search? (y/n)"

    input = inputs.shift || gets.chomp
    break if input.downcase.starts_with?('n')
  end
end

runner