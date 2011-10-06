require "spec_helper"

describe Scrambler::RandomState::Solver do
  include Scrambler::RandomState

  before(:all) do
    @solver ||= Solver.new
  end

  it "should solve scramble R U optimally" do
    @solver.solve(CornerPermutation.new([3, 1, 5, 2, 0, 4, 6]), CornerOrientation.new([0, 1, 2, 0, 2, 1, 0])).should == "U' R'"
  end

  it "should solve scramble U R U' R' optimally" do
    @solver.solve(CornerPermutation.new([3, 5, 2, 0, 4, 1, 6]), CornerOrientation.new([0, 1, 0, 1, 0, 1, 0])).should == "R U R' U'"
  end

  it "should solve scramble F U R U' R' F' optimally" do
    @solver.solve(CornerPermutation.new([3, 2, 1, 0, 4, 5, 6]), CornerOrientation.new([0, 0, 2, 1, 0, 0, 0])).should == "F R U R' U' F'"
  end

  it "should solve 8 move scramble optimally" do
    @solver.solve(CornerPermutation.new([0, 1, 4, 2, 5, 6, 3]), CornerOrientation.new([2, 1, 2, 2, 0, 2, 0])).should == "U R' U2 F R' F U2 F'"
  end

  it "should solve 9 move scramble optimally" do
    @solver.solve(CornerPermutation.new([0, 5, 6, 3, 2, 1, 4]), CornerOrientation.new([2, 1, 1, 2, 0, 2, 1])).should == "R U' F' R2 F R' F U2 R'"
  end

  it "should solve 10 move scramble optimally" do
    @solver.solve(CornerPermutation.new([2, 5, 0, 6, 1, 4, 3]), CornerOrientation.new([2, 1, 2, 1, 1, 2, 0])).should == "U2 F U' R2 U F2 U R' U' R2"
  end

  it "should solve 11 move scramble optimally" do
    @solver.solve(CornerPermutation.new([3, 2, 1, 0, 4, 5, 6]), CornerOrientation.new([0, 0, 0, 0, 0, 0, 0])).should == "R U2 R' U' F U2 R' F' R U' F2"
  end
end

