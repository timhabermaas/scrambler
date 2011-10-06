require "scrambler/random_state/corner_orientation"
require "scrambler/random_state/corner_permutation"

module Scrambler
  module RandomState
    class Solver
      SOLVED_PERMUTATION = [0, 1, 2, 3, 4, 5, 6]
      SOLVED_ORIENTATION = [0] * 7
      TURNS = [:R, :U, :F]
      MODS = ["", "2", "'"]

      def initialize
        @permutation_map = []
        SOLVED_PERMUTATION.permutation.each do |p|
          @permutation_map[CornerPermutation.new(p).to_i] = { :R => CornerPermutation.new(p).turn!(:R).to_i,
                                                              :U => CornerPermutation.new(p).turn!(:U).to_i,
                                                              :F => CornerPermutation.new(p).turn!(:F).to_i,
                                                              :length => -1
                                                            }
        end

        @permutation_map[123456][:length] = 0
        7.times do |l|
          SOLVED_PERMUTATION.permutation.each do |p|
            if @permutation_map[CornerPermutation.new(p).to_i][:length] == l
              [:R, :U, :F].each do |m|
                q = CornerPermutation.new(p).to_i
                3.times do |c|
                  q = @permutation_map[q][m]
                  @permutation_map[q][:length] = l + 1 if @permutation_map[q][:length] == -1
                end
              end
            end
          end
        end

        @orientation_map = []
        (3**7).times do |i|
          @orientation_map[i] = { :R => CornerOrientation.new(i).turn!(:R).to_i,
                                  :U => CornerOrientation.new(i).turn!(:U).to_i,
                                  :F => CornerOrientation.new(i).turn!(:F).to_i,
                                  :length => -1
                                }
        end

        6.times do |l|
          (3**7).times do |o|
            if @orientation_map[o][:length] == l
              [:R, :U, :F].each do |m|
                q = o
                3.times do |c|
                  q = @orientation_map[q][m]
                  @orientation_map[q][:length] = l + 1 if @orientation_map[q][:length] == -1
                end
              end
            end
          end
        end
      end

      def solve(corner_permutation, corner_orientation)
        @solution = []
        move_limit = -1
        begin
          move_limit += 1
        end while !search(corner_permutation.to_i, corner_orientation.to_i, move_limit)
        @solution.map { |t| t[0].to_s + t[1] }.join " "
      end

    private

      def search(current_permutation, current_orientation, limit, depth = 0, last_move = nil)
        if current_permutation == 123456 and current_orientation == 0
          return true
        elsif limit == 0
          return false
        else
          return false if @permutation_map[current_permutation][:length] > limit or @orientation_map[current_orientation][:length] > limit
          TURNS.each do |turn|
            if last_move != turn
              next_permutation = current_permutation
              next_orientation = current_orientation
              MODS.each do |modifier|
                next_permutation = @permutation_map[next_permutation][turn]
                next_orientation = @orientation_map[next_orientation][turn]
                @solution[depth] = [turn, modifier]
                return true if search(next_permutation, next_orientation, limit - 1, depth + 1, turn)
              end
            end
          end
        end

        return false
      end
    end
  end
end