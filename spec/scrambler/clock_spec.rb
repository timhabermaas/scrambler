require "spec_helper"

describe Scrambler::Clock do
  it "should scramble using all pin combinations" do
    scramble = subject.scramble
    scramble.should include("UUdd")
    scramble.should include("dUdU")
    scramble.should include("ddUU")
    scramble.should include("UdUd")
    scramble.should include("dUUU")
    scramble.should include("UdUU")
    scramble.should include("UUdU")
    scramble.should include("UUUd")
    scramble.should include("UUUU")
    scramble.should include("dddd")
  end

  it "should have 9 u and 5 d turns" do
    scramble = subject.scramble
    scramble.scan(/u=-?\d+/).should have(9).elements
    scramble.scan(/d=-?\d+/).should have(5).elements
  end

  it "should only turn clocks between -5 and 6 hours" do
    10.times do
      subject.scramble.scan(/u=(-?\d+)/) do |value|
        (-5..6).should include(value.first.to_i) # test for value being a number
      end
    end
  end
end