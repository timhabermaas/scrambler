require "spec_helper"

describe Scrambler::SixBySix do
  let(:valid_turns) { ["", "2", "3"].product(%w(R L U D F B)).map { |l, t| l + t }.product(["", "'", "2"]).map{ |t, m| t + m } }

  it "should default to a 80 move scramble" do
    subject.scramble.split(" ").should have(80).elements
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