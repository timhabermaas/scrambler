module Scrambler
  class FourByFour
    def scramble(length = 40)
      turns = [%w{R L Rw Lw}, %w{F B Fw Bw}, %w{D U Dw Uw}]
      variants = ['', "'", '2']
      axis = rand turns.size
      (1..length).map do
        axis = (axis + rand(turns.size - 1) + 1) % turns.size
        turns[axis].sample + variants.sample
      end.join(' ')
    end
  end
end