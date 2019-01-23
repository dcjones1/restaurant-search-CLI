require_relative 'spec_helper'

describe Restaurant do
  let(:dc) { Location.create(title: "Washington D.C.", latitude: 0.0, longitude: 0.0, city_name: "Washington D.C.", city_id: 1, country_name: "US") }

  let(:one_dollar) { Restaurant.create(name: "One Dollar", location: dc, price_range: 1) }
  let(:two_dollar) { Restaurant.create(name: "Two Dollar", location: dc, price_range: 2) }
  let(:four_dollar) { Restaurant.create(name: "Two Dollar", location: dc, price_range: 4) }

  it "has data attributes" do
    aoba = Restaurant.create(name: "Aoba", location: dc)
    expect(aoba.name).to eq("Aoba") 
  end
  
  it "filters max price range" do
    expect(Restaurant.max_price_range(2)).to contain_exactly(one_dollar, two_dollar)
  end

  it "filters min price range" do
    expect(Restaurant.min_price_range(3)).to contain_exactly(four_dollar)
  end

  it "filters within price range" do
    expect(Restaurant.within_price_range(2, 3)).to contain_exactly(two_dollar)
  end
end