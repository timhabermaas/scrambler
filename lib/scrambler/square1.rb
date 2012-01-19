module Scrambler
  class Square1
    def scramble(length = 0)
      scramble = []
      up_layer = (0..7).map{|i| i%2 == 0 ? 30 : 60}
      down_layer = [up_layer].flatten!
      length = 0
      begin
        up_moves = possible_moves up_layer
        down_moves = possible_moves down_layer
        up_move = up_moves.sample
        down_moves.delete 0 if up_move == 0
        down_move = down_moves.sample
        scramble << [humanize_sq_one_move(up_layer, up_move), humanize_sq_one_move(down_layer, down_move) * -1]
        do_move up_layer, up_move
        do_move down_layer, down_move
        length += up_move == 0 ? 0 : 1
        length += down_move == 0 ? 0 : 1
        do_slice(up_layer, down_layer)
        length += 1
      end while length <= 40 + 1
      scramble.map {|s| "(#{s.join(',')})"}.join(' ')
    end

  private
    def humanize_sq_one_move(layer, move)
      move = layer[0..move - 1].inject(0){|sum, x| x == 30 ? sum + 1 : sum + 2} unless move == 0
      move > 6 ? move - 12 : move
    end

    def possible_moves(layer)
      layer_moves = []
      layer.length.times do |start|
        sum = 0
        possible = false
        layer.length.times do |i|
          sum += layer[(start + i) % layer.length]
          possible = true if sum == 180
        end
        layer_moves << start if possible
      end
      layer_moves
    end

    def do_move(layer, l)
      l %= layer.length
      l.times do
        layer << layer.shift
      end
      layer
    end

    def do_slice(up, down)
      sum = 0
      small_up, big_up = up.partition {|n| sum += n; sum <= 180}
      small_down, big_down = down.partition {|n| sum += n; sum <= 540}
      up.replace(small_down.reverse + big_up)
      down.replace(small_up.reverse + big_down)
    end
  end
end