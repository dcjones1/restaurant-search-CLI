require 'bundler/setup'
Bundler.require

require 'rake'
require 'sinatra/activerecord'
require 'require_all'

require_relative '../app/models/category_restaurant.rb'
require_relative '../app/models/category.rb'
require_relative '../app/models/location.rb'
require_relative '../app/models/restaurant.rb'
require_relative '../app/models/review.rb'
require_relative '../app/api/api.rb'

DBNAME = "restaurant_search"

# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

require_relative './databaseconfig.rb'
