require "scrambler/random_state/corner_orientation"
require "scrambler/random_state/corner_permutation"

module Scrambler
  module RandomState
    class Solver
      SOLVED_PERMUTATION = [0, 1, 2, 3, 4, 5, 6]
      SOLVED_ORIENTATION = [0] * 7

      def initialize
        @permutation_map = {}
        SOLVED_PERMUTATION.permutation.each do |p|
          @permutation_map[p] = { :R => CornerPermutation.new(p).turn!(:R),
                                  :U => CornerPermutation.new(p).turn!(:U),
                                  :F => CornerPermutation.new(p).turn!(:F)
                                }
        end

        @orientation_map = {}
        (3**7).times do |i|
          number = "%07d" % i.to_s(3)
          o = number.split(//).map { |e| e.to_i } # TODO remove parity
          @orientation_map[o] = { :R => CornerOrientation.new(o).turn!(:R),
                                  :U => CornerOrientation.new(o).turn!(:U),
                                  :F => CornerOrientation.new(o).turn!(:F)
                                }
        end
      end

      def solve(corner_permutation, corner_orientation)
        move_limit = -1
        begin
          move_limit += 1
        end while !(solution = search(corner_permutation, corner_orientation, move_limit))

        solution.join " "
      end

    private
      def search(current_permutation, current_orientation, limit, solution = [], moves = 0)
        if current_permutation.to_a == SOLVED_PERMUTATION and current_orientation.to_a == SOLVED_ORIENTATION
          return solution
        elsif moves >= limit
          return false
        else
          [:R, :U, :F].each do |turn|
            if solution.last == nil or solution.last[0] != turn
              next_permutation = current_permutation
              next_orientation = current_orientation
              ["", "2", "'"].each do |modifier|
                next_permutation = @permutation_map[next_permutation.to_a][turn]
                next_orientation = @orientation_map[next_orientation.to_a][turn]
                s = search(next_permutation, next_orientation, limit, solution + ["#{turn}#{modifier}"], moves + 1)
                return s if s
              end
            end
          end
        end

        return false
      end
    end
  end
end