# TODO Connascence of position...
# Up:
# 3 0
# 2 1
# Down
# - 4
# 6 5
module Scrambler
  module RandomState
    class CornerOrientation
      def initialize(orientation = [0] * 7)
        @orientation = orientation.clone
      end

      def to_a
        @orientation
      end

      def turn(move)
        o = @orientation.clone
        case move
        when :R
          @orientation = [(o[1] + 1) % 3, (o[5] + 2) % 3, o[2], o[3], (o[0] + 2) % 3, (o[4] + 1) % 3, o[6]]
        when :F
          @orientation = [o[0], (o[2] + 1) % 3, (o[6] + 2) % 3, o[3], o[4], (o[1] + 2) % 3, (o[5] + 1) % 3]
        when :U
          @orientation = [o[3], o[0], o[1], o[2], o[4], o[5], o[6]]
        end
        self
      end
    end
  end
end