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
end