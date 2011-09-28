require "spec_helper"

describe Scrambler::RandomState::CornerOrientation do
  it "should have all corners soriented right after initialization" do
    subject.to_i.should == 0
    subject.to_a.should == [0] * 8
  end

  it "should have orientation [1, 2, 0, 0, 2, 1, 0, 0] after R turn" do
    subject.turn(:R).to_a.should == [1, 2, 0, 0, 2, 1, 0, 0]
  end

  it "should have orientation [0, 1, 2, 0, 0, 2, 1, 0] after F turn" do
    subject.turn(:F).to_a.should == [0, 1, 2, 0, 0, 2, 1, 0]
  end

  it "should have orientation [0, 0, 0, 0, 0, 0, 0, 0] after U turn" do
    subject.turn(:U).to_a.should == [0, 0, 0, 0, 0, 0, 0, 0]
  end

  it "should have orientation [0, 1, 2, 0, 2, 1, 0, 0] after R U turns" do
    subject.turn(:R).turn(:U).to_a.should == [0, 1, 2, 0, 2, 1, 0, 0]
  end

  it "should have all corners oriented after a U-Perm" do
    subject.turn(:R).turn(:R).turn(:U).turn(:U).turn(:U).
            turn(:R).turn(:R).turn(:R).turn(:U).turn(:U).turn(:U).
            turn(:R).turn(:U).turn(:R).turn(:U).turn(:R).
            turn(:U).turn(:U).turn(:U).turn(:R).to_a.should == [0] * 8
  end

  it "should return 412 as numerical representation after R turn" do
    subject.turn(:R).to_i.should == 412
  end
end