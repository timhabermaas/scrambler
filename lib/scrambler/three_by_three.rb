require "scrambler/cube"

module Scrambler
  class ThreeByThree < Cube
    def scramble(length = 25)
      turns = [%w{R L}, %w{F B}, %w{D U}]
      super turns, length
    end
  end
end