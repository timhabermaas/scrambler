require "scrambler/random_state/corner_orientation"
require "scrambler/random_state/corner_permutation"
require "scrambler/random_state/solver"

module Scrambler
  module RandomState
    class TwoByTwo
      def initialize
        @solver = Solver.new
      end

      def scramble
        permutation = Solver::SOLVED_PERMUTATION.shuffle
        orientation = Array.new(6) { rand 3 }
        orientation += [2 - orientation.inject { |sum, i| sum + i } % 3] # fix orientation parity

        @solver.solve(CornerPermutation.new(permutation), CornerOrientation.new(orientation))
      end
    end
  end
end