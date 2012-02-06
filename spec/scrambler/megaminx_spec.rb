require "spec_helper"

describe Scrambler::Megaminx do
  let(:valid_turns) { %w(R++ R-- D++ D--) }

  subject { Scrambler::Megaminx.new.scramble }

  it "should default to 7 lines and 10 columns" do
    lines = subject.split("\n")
    lines.should have(7).elements
    lines.each do |line|
      line.split(" ").should have(11).elements
    end
  end

  it "should have U / U' at the end of each line" do
    subject.split("\n").each do |line|
      line.should match(/U'?\Z/)
    end
  end

  it "should contain R++/R-- and D++/D-- turns at the first 'column' turns" do
    subject.split("\n"). each do |line|
      line.split(" ")[0..-2].each do |turn|
        valid_turns.should include(turn)
      end
    end
  end

  it "should switch between R and D turns, beginning with R" do
    basic_turns = subject.split("\n").first.split(" ").map { |t| t[0..0] }
    basic_turns[0].should == "R"
    basic_turns[1].should == "D"
    basic_turns[2].should == "R"
    basic_turns[3].should == "D"
    basic_turns[4].should == "R"
    basic_turns[5].should == "D"
    basic_turns[6].should == "R"
    basic_turns[7].should == "D"
  end
end
