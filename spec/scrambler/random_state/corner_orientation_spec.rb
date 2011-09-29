require "spec_helper"

describe Scrambler::RandomState::CornerOrientation do
  include Scrambler::RandomState

  it "should have all corners oriented right after initialization" do
    subject.to_a.should == [0] * 7
    subject.to_i.should == 0
  end

  it "should have orientation [1, 2, 0, 0, 2, 1, 0] after R turn" do
    co = subject.turn!(:R)
    co.to_a.should == [1, 2, 0, 0, 2, 1, 0]
    co.to_i.should == 412
  end

  it "should have orientation [0, 1, 2, 0, 0, 2, 1] after F turn" do
    subject.turn!(:F).to_a.should == [0, 1, 2, 0, 0, 2, 1]
  end

  it "should have orientation [0, 0, 0, 0, 0, 0, 0] after U turn" do
    subject.turn!(:U).to_a.should == [0, 0, 0, 0, 0, 0, 0]
    subject.turn!(:U).to_i.should == 0
  end

  it "should have orientation [0, 1, 2, 0, 2, 1, 0] after R U turns" do
    subject.turn!(:R).turn!(:U).to_a.should == [0, 1, 2, 0, 2, 1, 0]
  end

  it "should have all corners oriented after a U-Perm" do
    subject.turn!(:R).turn!(:R).turn!(:U).turn!(:U).turn!(:U).
            turn!(:R).turn!(:R).turn!(:R).turn!(:U).turn!(:U).turn!(:U).
            turn!(:R).turn!(:U).turn!(:R).turn!(:U).turn!(:R).
            turn!(:U).turn!(:U).turn!(:U).turn!(:R).to_a.should == [0] * 7
  end

  it "should accept numbers and arrays as initial value" do
    CornerOrientation.new(248).to_a.should == [2, 1, 0, 0, 0, 1, 0]
    CornerOrientation.new([2, 1, 0, 0, 0, 1, 0]).to_i.should == 248
  end
end