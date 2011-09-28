require "scrambler/cubes/corner_orientation"
require "scrambler/cubes/corner_permutation"

module Scrambler
  class Cube
    def scramble(turns, length)
      variants = ['', "'", '2']
      axis = rand turns.size
      (1..length).map do
        axis = (axis + rand(turns.size - 1) + 1) % turns.size
        turns[axis].sample + variants.sample
      end.join(' ')
    end
  end

  class TwoByTwo < Cube
    def initialize(random_state = false)
      @random_state = random_state
    end

    def scramble(length = 20)
      turns = [%w{R L}, %w{F B}, %w{D U}]
      super turns, length
    end
  end

  class ThreeByThree < Cube
    def scramble(length = 25)
      turns = [%w{R L}, %w{F B}, %w{D U}]
      super turns, length
    end
  end

  class FourByFour < Cube
    def scramble(length = 40)
      turns = [%w{R L Rw Lw}, %w{F B Fw Bw}, %w{D U Dw Uw}]
      super turns, length
    end
  end

  class FiveByFive < Cube
    def scramble(length = 60)
      turns = [%w{R L Rw Lw}, %w{F B Fw Bw}, %w{D U Dw Uw}]
      super turns, length
    end
  end

  class SixBySix < Cube
    def scramble(length = 80)
      turns = [%w(R L 2R 2L 3R 3L), %w(F B 2F 2B 3F 3B), %w(D U 2D 2U 3D 3U)]
      super turns, length
    end
  end

  class SevenBySeven < Cube
    def scramble(length = 100)
      turns = [%w(R L 2R 2L 3R 3L), %w(F B 2F 2B 3F 3B), %w(D U 2D 2U 3D 3U)]
      super turns, length
    end
  end
end