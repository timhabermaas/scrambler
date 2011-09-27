module Scrambler
  class Pyraminx
    def scramble(length = 25)
      turns = %w(U L R B)
      variants = ['', "'"]

      tip_turns = turns.map &:downcase
      tip_length = rand(3) + 1
      scramble = (0..tip_length).map do
        tip_turns.delete(tip_turns.sample) + variants.sample
      end

      axis = rand turns.size
      scramble += (1..length).map do
        axis = (axis + rand(turns.size - 1) + 1) % turns.size
        turns[axis] + variants.sample
      end

      scramble.join(" ")
    end
  end
end