require_relative '../config/environment.rb'
require_all 'app/models'

def greeting
  puts "\nPlease Enter a Location (Either Location Name or Lat/Long):"
end

def main_menu
  puts "1) Nearby (w/in 3 miles)
  \n2) New
  \n3) Highly Rated\n"
  return gets.chomp
end

def list_nearby
  # perform db `/search` based on location lat/long
  # return db results
  # => [array of Restaurant]
  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    print_restaurant(restaurant)
  end
end

def list_new
  # perform db `/search` based on number of reviews/maybe timestamp
  # return db results
  # => [array of Restaurant]
  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    print_restaurant(restaurant)
  end
end

def list_highly_rated
  # perform db `/search` based on avg reviews
  # return db results
  # => [array of Restaurant]
  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    print_restaurant(restaurant)
  end
end

def print_restaurant(restaurant)
  puts "* #{restaurant.name}"
  # puts "* #{restaurant_object}"   #human-readable hash??
end

def runner
  while true
    greeting
    input = main_menu

    case input
    when "1"
      list_nearby
    when "2"
      list_new
    when "3"
      list_highly_rated
    end

    puts "\nDo you want to perform another search?(y/n)"
    input = gets.chomp
    # break if /[nN]/ =~ input
    break if input == 'n'
  end
end

runner

# def menu(items)
#   # print out items, numbered
#   # get
# end
