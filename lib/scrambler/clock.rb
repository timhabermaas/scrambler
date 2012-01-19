module Scrambler
  class Clock
    def scramble(length = 0)
      pins = %w(U d)
      states = %w(UUdd dUdU ddUU UdUd dUUU UdUU UUUd UUdU UUUU dddd)
      scramble = states.map do |state|
        moves = []
        u = rand(12) - 5
        d = rand(12) - 5
        moves << 'u=' + u.to_s if state.gsub('d', '').length > 1
        moves << 'd=' + d.to_s if state.gsub('U', '').length > 1
        state + ' ' + moves.join('; ')
      end
      scramble << Array.new(4).map do
        pins.sample
      end.join
      scramble.join(' / ')
    end
  end
end