require_relative 'spec_helper'

describe Review do
  let(:dc) { Location.create(title: "Washington D.C.", latitude: 0.0, longitude: 0.0, city_name: "Washington D.C.", city_id: 1, country_name: "US") }
  let(:aoba) { Restaurant.create(name: "Aoba", location: dc, price_range: 1, avg_cost_for_two: 20.0, avg_rating: 4.5, votes: 1329) }
  let(:aoba_review) { Review.create(rating: 5, review_text: "super fresh fish with great service", rating_text: "5/5", timestamp: 1516413813, restaurant_id: aoba.id) }

  it "has data attributes" do
    expect(aoba_review.rating).to eq(5)
    expect(aoba_review.review_text).to eq("super fresh fish with great service")
    expect(aoba_review.rating_text).to eq("5/5")
  end

  it "converts timestamp to datetime" do
    date = Time.at(aoba_review.timestamp).utc.to_datetime
    expect(aoba_review.date).to eq(date)
  end
end