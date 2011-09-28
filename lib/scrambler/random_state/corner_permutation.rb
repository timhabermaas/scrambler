module Scrambler
  module RandomState
    class CornerPermutation
      def initialize
        @permutation = [0, 1, 2, 3, 4, 5, 6]
      end

      def to_a
        @permutation + [7]
      end

      def turn(move)
        p = @permutation.clone
        case move
        when :R
          @permutation = [p[1], p[5], p[2], p[3], p[0], p[4], p[6]]
        when :F
          @permutation = [p[0], p[2], p[6], p[3], p[4], p[1], p[5]]
        when :U
          @permutation = [p[3], p[0], p[1], p[2], p[4], p[5], p[6]]
        end
        self
      end
    end
  end
end