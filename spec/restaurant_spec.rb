require_relative 'spec_helper'

describe Restaurant do
  let(:dc) { Location.create(title: "Washington D.C.", latitude: 0.0, longitude: 0.0, city_name: "Washington D.C.", city_id: 1, country_name: "US") }

  let!(:one_dollar) { Restaurant.create(name: "One Dollar", location: dc, price_range: 1, avg_cost_for_two: 20.0, avg_rating: 4.5, votes: 1329, latitude: 38.8833141348, longitude: -76.9937285746, phone_number: "(555) 555-5555") }
  let!(:two_dollar) { Restaurant.create(name: "Two Dollar", location: dc, price_range: 2, avg_cost_for_two: 55.0, avg_rating: 2.3, votes: 284, latitude: 38.875547, longitude: -77.006133) }
  let(:three_dollar) { Restaurant.create(name: "Three Dollar", location: dc, price_range: 3, avg_cost_for_two: 100.0, avg_rating: 3.9, votes: 102, latitude: 38.9001076283, longitude: -76.9978329697) }
  let(:four_dollar) { Restaurant.create(name: "Two Dollar", location: dc, price_range: 4, avg_cost_for_two: 250.0, avg_rating: 4.2, votes: 858) }

  it "has data attributes" do
    aoba = Restaurant.create(name: "Aoba", location: dc)
    expect(aoba.name).to eq("Aoba") 
  end
  
  it "filters max average cost" do
    expect(Restaurant.max_avg_cost(25)).to contain_exactly(one_dollar)
    expect(Restaurant.max_avg_cost(1)).to be_empty
  end

  it "filters min average cost" do
    expect(Restaurant.min_avg_cost(50)).to contain_exactly(three_dollar, four_dollar)
  end

  it "filters within average cost range" do
    expect(Restaurant.within_avg_cost(15, 70)).to contain_exactly(two_dollar, three_dollar)
  end

  it "finds nearby restaurants" do
    expect(one_dollar.nearby_restaurants(1)).to contain_exactly(two_dollar)
  end

  it "fuzzy finds by name" do
    expect(Restaurant.fuzzy_find("One")).to eq(one_dollar)
    expect(Restaurant.fuzzy_find("two dllr")).to eq(two_dollar)
  end

  it "strips non-digits from phone number" do
    expect(one_dollar.phone_digits).to eq(5555555555)
  end
end