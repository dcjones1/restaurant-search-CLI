require_relative '../config/environment.rb'
require_relative 'cli_methods.rb'

def runner(inputs = [])
  while true
    location = greeting
    location = Location.find_by(title: location)
    input = main_menu
    binding.pry
    case input
    when 1
      #average cost
    when 2
      #category
    when "Name"
      
    end

    puts "\nDo you want to perform another search? (y/n)"

    input = inputs.shift || gets.chomp
    break if input.downcase.starts_with?('n')
  end
end


runner
