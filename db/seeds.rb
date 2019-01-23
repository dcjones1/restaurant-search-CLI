#categories
Category.destroy_all
japanese = Category.create(name: 'Japanese')
korean = Category.create(name: 'Korean')

# locations
Location.destroy_all
dc = Location.create(title: "Washington D.C.", latitude: 0.0, longitude: 0.0, city_name: "Washington D.C.", city_id: 1, country_name: "US")
baltimore = Location.create(title: "Baltimore", latitude: 0.0, longitude: 0.0, city_name: "Baltimore", city_id: 2, country_name: "US")



# restaurants
Restaurant.destroy_all
aoba = Restaurant.create(name: "Aoba", location: dc)
iron = Restaurant.create(name: "Iron Age", location: dc)
sakura = Restaurant.create(name: "Sakura", location: baltimore)
honey = Restaurant.create(name: "Honey Pig", location: baltimore)





#reviews
Review.destroy_all
aoba_review = Review.create(rating: 5, review_text: "super fresh fish with great service", rating_text: "5/5", restaurant_id: aoba.id)
iron_review = Review.create(rating: 2, rating_text: "2/5", review_text: "this restaurant is called iron age", timestamp: 1548185278, restaurant_id: iron.id)
honey_review = Review.create(rating: 3, review_text: "Iron Age in DC is so much better.", rating_text: "Mediocre", restaurant_id: honey.id)
