require "spec_helper"

describe Scrambler::RandomState::TwoByTwo do
  include Scrambler::RandomState

  let(:valid_turns) { %w(R R' R2 U U' U2 F F' F2) }

  it "should not have more than 11 moves" do
    subject.scramble.split(" ").size.should be <= 11
  end

  it "should only contain moves out or <R, F, U>" do
    subject.scramble.split(" ").each do |turn|
      valid_turns.should include(turn)
    end
  end

  it "should return different scrambles (almost) every time" do
    subject.scramble.should_not == subject.scramble
  end
end