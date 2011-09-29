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
        case orientation
        when Array
          @orientation = orientation.clone
        else
          @orientation = convert_to_array orientation
        end
      end

      def to_a
        @orientation
      end

      def to_i
        n = -1
        @orientation.inject(0) { |sum, i| n += 1; sum + i * (3**n) }
      end

      def turn!(move)
        o = @orientation
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

    private
      def convert_to_array(number)
        short = number.to_s(3).reverse.split(//).map do |s|
          s.to_i
        end
        short + [0] * (7 - short.size)
      end
    end
  end
end