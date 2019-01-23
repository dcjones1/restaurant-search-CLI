require_relative 'spec_helper'

describe Location do
  let(:dc) { Location.create(title: "Washington D.C.", latitude: 0.0, longitude: 0.0, city_name: "Washington D.C.", city_id: 1, country_name: "US") }

  it "has data attributes" do
    expect(dc.title).to eq("Washington D.C.")
    expect(dc.latitude).to eq(0.0)
    expect(dc.longitude).to eq(0.0)
    expect(dc.city_id).to eq(1)
    expect(dc.country_name).to eq("US")
  end
end