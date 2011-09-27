require "spec_helper"

describe Scrambler::Megaminx do
  let(:valid_turns) { %w(R++ R-- D++ D--) }

  it "should default to 7 lines and 10 columns" do
    lines = subject.scramble.split("\n")
    lines.should have(7).elements
    lines.each do |line|
      line.split(" ").should have(11).elements
    end
  end

  it "should have U / U' at the end of each line" do
    subject.scramble.split("\n").each do |line|
      line.should match(/U'?\Z/)
    end
  end

  it "should contain R++/R-- and D++/D-- turns at the first 'column' turns" do
    subject.scramble.split("\n"). each do |line|
      line.split(" ")[0..-2].each do |turn|
        valid_turns.should include(turn)
      end
    end
  end
end