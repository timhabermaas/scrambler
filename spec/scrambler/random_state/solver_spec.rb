require "spec_helper"

describe Scrambler::RandomState::Solver do
  include Scrambler::RandomState

  it "should solve scramble R U optimally" do
    subject.solve(CornerPermutation.new([3, 1, 5, 2, 0, 4, 6]), CornerOrientation.new([0, 1, 2, 0, 2, 1, 0])).should == "U' R'"
  end

  it "should solve scramble F U R U' R' F' optimally" do
    subject.solve(CornerPermutation.new([3, 2, 1, 0, 4, 5, 6]), CornerOrientation.new([0, 0, 2, 1, 0, 0, 0])).should == "F R U R' U' F'"
  end
end