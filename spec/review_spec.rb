require_relative 'spec_helper'

describe Review do
  let(:dc) { Location.create(title: "Washington D.C.", latitude: 0.0, longitude: 0.0, city_name: "Washington D.C.", city_id: 1, country_name: "US") }
  let(:aoba) { Restaurant.create(name: "Aoba", location: dc) }

  it "has data attributes" do
    aoba_review = Review.create(rating: 5, review_text: "super fresh fish with great service", rating_text: "5/5", restaurant_id: aoba.id)
    expect(aoba_review.rating).to eq(5)
    expect(aoba_review.review_text).to eq("super fresh fish with great service")
    expect(aoba_review.rating_text).to eq("5/5")
  end
end