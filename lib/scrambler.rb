require "scrambler/version"

require "scrambler/pyraminx"

module Scrambler
  class Scrambler
    def scramble(puzzle)
      turns = [%w{R L}, %w{F B}, %w{D U}]
      variants = ['', "'", '2']
      axis = rand turns.size
      (1..25).map do
        axis = (axis + rand(turns.size - 1) + 1) % turns.size
        turns[axis].sample + variants.sample
      end.join(' ')
    end
  end
end