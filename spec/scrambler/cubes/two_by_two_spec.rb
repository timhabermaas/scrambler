require "spec_helper"

describe Scrambler::TwoByTwo do
  let(:valid_turns) { %w(L L' L2 R R' R2 U U' U2 B B' B2 F F' F2 D D' D2) }

  it "should default to a 20 move scramble" do
    subject.scramble.split(" ").should have(20).elements
  end

  it "should return a 10 move scramble" do
    subject.scramble(10).split(" ").should have(10).elements
  end

  it "should contain only valid turns" do
    subject.scramble.split(" ").each do |turn|
      valid_turns.should include(turn)
    end
  end
end