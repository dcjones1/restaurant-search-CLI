require_relative '../config/environment.rb'
require_relative 'cli_methods.rb'

def runner(inputs = [])
  while true
    location = greeting
    input = main_menu

    case input
    when 1
      list_nearby
    when 2
      list_highly_rated(location)
    when 3
      list_category
    end

    puts "\nDo you want to perform another search? (y/n)"

    input = inputs.shift || gets.chomp
    break if input.downcase.starts_with?('n')
  end
end

runner
