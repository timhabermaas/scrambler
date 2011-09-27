module Scrambler
  class Megaminx
    def scramble(lines = 7, columns = 10)
      turns = %w(R D)
      variants = %w(-- ++)
      variants_for_u = ["'", ""]
      (1..lines).map do |line|
        ((1..columns).map do |column|
          turns.sample + variants.sample
        end + ["U#{variants_for_u.sample}"]).join(" ")
      end.join("\n")
    end
  end
end