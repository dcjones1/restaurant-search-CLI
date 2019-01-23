#feed restaurants their location_id
# location_id = Restaurant.all.map(&:location).map(&:id)
# location_id.each_with_index do |id, index|
#   restaurant = Restaurant.find_by(id: index+1)
#   restaurant.location_id = id
# end
