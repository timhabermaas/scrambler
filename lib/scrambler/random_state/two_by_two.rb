require "scrambler/random_state/corner_orientation"
require "scrambler/random_state/corner_permutation"

module Scrambler
  module RandomState
    class TwoByTwo
      SOLVED_PERMUTATION = [0, 1, 2, 3, 4, 5, 6]
      SOLVED_ORIENTATION = [0] * 6

      def initialize
        @permutation_map = {}
        SOLVED_PERMUTATION.permutation.each do |p|
          @permutation_map[p] = { :R => CornerPermutation.new(p).turn(:R),
                                  :U => CornerPermutation.new(p).turn(:U),
                                  :F => CornerPermutation.new(p).turn(:F)
                                }
        end
      end

      def scramble
        permutation = SOLVED_PERMUTATION.shuffle
        orientation = Array.new(6) { rand 3 }
        orientation += [3 - orientation.inject { |sum, i| sum + i } % 3] # fix orientation parity

        solve(CornerPermutation.new(permutation), CornerOrientation.new(orientation))
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
        if current_permutation.to_a == SOLVED_PERMUTATION
          return solution
        elsif moves >= limit
          return false
        else
          [:R, :U, :F].each do |turn|
            unless solution.last == turn
              perm = current_permutation.clone
              ["", "2", "'"].each do |modifier|
                perm.turn(turn)
                s = search(perm, current_orientation, limit, solution + ["#{turn}#{modifier}"], moves + 1)
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