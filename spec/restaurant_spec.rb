require_relative 'spec_helper'

describe Restaurant do
  let(:dc) { Location.create(title: "Washington D.C.", latitude: 0.0, longitude: 0.0, city_name: "Washington D.C.", city_id: 1, country_name: "US") }

  it "has data attributes" do
    aoba = Restaurant.create(name: "Aoba", location: dc)
    expect(aoba.name).to eq("Aoba") 
  end
end