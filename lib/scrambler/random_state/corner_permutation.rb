module Scrambler
  module RandomState
    class CornerPermutation
      def initialize(permutation = [0, 1, 2, 3, 4, 5, 6])
        case permutation
        when Array
          @permutation = permutation.clone
        else
          @permutation = convert_to_array(permutation)
        end
      end

      def to_a
        @permutation
      end

      def to_i
        @permutation.map do |piece|
          piece.to_s
        end.join.to_i
      end

      def turn!(move)
        p = @permutation
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

    private
      def convert_to_array(number)
        result = number.to_s.split(//).map { |s| s.to_i }
        result.size < 7 ? [0] + result : result
      end
    end
  end
end