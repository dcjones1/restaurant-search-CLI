require 'active_record'
require './config/databaseconfig.rb'
require 'sinatra/activerecord/rake'

# task :environment do
#   ENV["ACTIVE_RECORD_ENV"] ||= "development"
#   require_relative './config/environment'
# end
#
# include ActiveRecord::Tasks
# DatabaseTasks.db_dir = 'db'
# DatabaseTasks.migrations_paths = 'db/migrate'
# seed_loader = Class.new do
#   def load_seed
#     load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
#   end
# end
# DatabaseTasks.seed_loader = seed_loader.new
# load 'active_record/railties/databases.rake'

task :console do
  Pry.start
end
