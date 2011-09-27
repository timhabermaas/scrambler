require "scrambler/cube"

module Scrambler
  class FourByFour < Cube
    def scramble(length = 40)
      turns = [%w{R L Rw Lw}, %w{F B Fw Bw}, %w{D U Dw Uw}]
      super turns, length
    end
  end
end