# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_23_210426) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_api_id"
  end

  create_table "category_restaurants", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "category_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "title"
    t.float "latitude"
    t.float "longitude"
    t.string "city_name"
    t.integer "city_id"
    t.string "country_name"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.integer "restaurant_api_id"
    t.string "url"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.float "avg_cost_for_two", default: 0.0
    t.integer "price_range"
    t.float "avg_rating", default: 0.0
    t.integer "votes", default: 0
    t.string "phone_number"
    t.integer "location_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "rating_api_id"
    t.string "review_text"
    t.string "rating_text"
    t.datetime "timestamp"
    t.integer "restaurant_id"
  end

end
