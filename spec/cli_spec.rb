require_relative 'spec_helper'

describe :CLI do
  it 'expects correct output' do
    output = []
    output << "Please Enter a Location (Either Location Name or Lat/Long):"
    output << "1) Nearby (w/in 3 miles)"
    output << "2) New"
    output << "3) Highly Rated"
    # needs more output...
    
    input = ['1', 'y', '2', 'n']
    expect{runner(input)}.to output(output.join('\n')).to_stdout
  end
end