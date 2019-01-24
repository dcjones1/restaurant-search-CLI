require_relative 'spec_helper'

describe "Helper" do
  it "calculates mile distance between lat/long coordinates" do
    expect(distance_between(77, 1, 78, 1)).to eq(69.05)
  end
end