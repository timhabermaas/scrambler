module Scrambler
  module RandomState
    class CubeState
      attr_reader :orientation, :permutation

      def initialize
        @orientation = [0] * 8
        @permutation = [0, 1, 2, 3, 4, 5, 6, 7]
      end

      def turn!(layer)
        o = @orientation.clone
        p = @permutation.clone
        case layer
        when :R
          @permutation = [p[1], p[5], p[2], p[3], p[0], p[4], p[6], p[7]]
          @orientation = [(o[1] + 1) % 3, (o[5] + 2) % 3, o[2], o[3], (o[0] + 2) % 3, (o[4] + 1) % 3, o[6], o[7]]
        when :F
          @permutation = [p[0], p[2], p[6], p[3], p[4], p[1], p[5], p[7]]
          @orientation = [o[0], (o[2] + 1) % 3, (o[6] + 2) % 3, o[3], o[4], (o[1] + 2) % 3, (o[5] + 1) % 3, o[7]]
        when :U
          @permutation = [p[3], p[0], p[1], p[2], p[4], p[5], p[6], p[7]]
          @orientation = [o[3], o[0], o[1], o[2], o[4], o[5], o[6], o[7]]
        end
      end
    end
  end
end