require "spec_helper"

describe Scrambler::Pyraminx do
  let(:valid_tip_turns) { %w(l l' r r' u u' b b') }
  let(:valid_turns) { %w(l l' r r' u u' b b' L L' R R' U U' B B') }

  it "should only include valid turns" do
    subject.scramble.split(" ").each do |turn|
      valid_turns.should include(turn)
    end
  end

  it "should not return the same results every time" do
    subject.scramble.should_not == subject.scramble
  end

  it "should return a 10 move scramble" do
    10.times do
      subject.scramble(10).split(" ").reject do |turn|
        valid_tip_turns.include? turn
      end.should have(10).elements
    end
  end
end