require "spec_helper"

describe Scrambler::RandomState::CornerPermutation do
  include Scrambler::RandomState

  it "should return solved permutation after initialization" do
    subject.to_a.should == [0, 1, 2, 3, 4, 5, 6]
    subject.to_i.should == 123456
  end

  it "should have permutation [1, 5, 2, 3, 0, 4, 6] after R turn" do
    subject.turn!(:R).to_a.should == [1, 5, 2, 3, 0, 4, 6]
  end

  it "should have permutation [0, 2, 6, 3, 4, 1, 5] after F turn" do
    subject.turn!(:F).to_a.should == [0, 2, 6, 3, 4, 1, 5]
  end

  it "should have permutation [3, 0, 1, 2, 4, 5, 6] after U turn" do
    subject.turn!(:U).to_a.should == [3, 0, 1, 2, 4, 5, 6]
  end

  it "should return proper number representation" do
    CornerPermutation.new([1, 0, 2, 4, 5, 6, 3]).to_i.should == 1024563
  end

  it "should accept numbers and convert them to arrays" do
    CornerPermutation.new(1024563).to_a.should == [1, 0, 2, 4, 5, 6, 3]
    CornerPermutation.new(123456).to_a.should == [0, 1, 2, 3, 4, 5, 6]
  end
end