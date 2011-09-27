module Scrambler
  class ThreeByThree
    def scramble(length = 25)
      turns = [%w{R L}, %w{F B}, %w{D U}]
      variants = ['', "'", '2']
      axis = rand turns.size
      (1..length).map do
        axis = (axis + rand(turns.size - 1) + 1) % turns.size
        turns[axis].sample + variants.sample
      end.join(' ')
    end
  end
end