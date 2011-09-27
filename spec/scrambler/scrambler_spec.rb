require "spec_helper"

describe Scrambler::Scrambler, "scrambling length" do
  it "should give a 25 move scramble for a 3x3x3" do
    scrambler = Scrambler::Scrambler.new
    scrambler.scramble(:"3x3x3").split(/ /).size.should eql(25)
  end
end