require "spec_helper"
require "scrambler/random_state/cube_state"

describe Scrambler::RandomState::CubeState do
  include Scrambler::RandomState

  Given(:cube) { CubeState.new }

  context "when new" do
    Then { cube.orientation.should == [0] * 8 }
    Then { cube.permutation.should == [0, 1, 2, 3, 4, 5, 6, 7] }
  end

  context "when turned R" do
    When { cube.turn! :R }

    Then { cube.orientation.should == [1, 2, 0, 0, 2, 1, 0, 0] }
    Then { cube.permutation.should == [1, 5, 2, 3, 0, 4, 6, 7] }
  end

  context "when turned F" do
    When { cube.turn! :F }

    Then { cube.orientation.should == [0, 1, 2, 0, 0, 2, 1, 0] }
    Then { cube.permutation.should == [0, 2, 6, 3, 4, 1, 5, 7] }
  end

  context "when turned U" do
    When { cube.turn! :U }

    Then { cube.orientation.should == [0] * 8 }
    Then { cube.permutation.should == [3, 0, 1, 2, 4, 5, 6, 7] }
  end
end