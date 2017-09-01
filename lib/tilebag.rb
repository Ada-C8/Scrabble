
module Scrabble
  class Tilebag

    attr_reader :num_tiles_remaining, :tilebag

    def initialize
      @tilebag = {a: 9, b:2, c:2, d:4, e:12, f:2, g:3, h:2, i:9, j:1, k:1, l:4, m:2, n:6, o:8, p:2, q:1, r:6, s:4, t:6, u:4, v:2, w:2, x:1, y:2, z:1}
      @num_tiles_remaining = 98
    end

    def draw_tiles(num)
      can_draw(num)
      drawn_tiles = []
      num.times do
        letter = @tilebag.keys.sample
        @tilebag[letter] -= 1
        @tilebag.delete_if {|key,value| value == 0}
        drawn_tiles << letter
      end
      @num_tiles_remaining -= num
      return drawn_tiles
    end

    def can_draw(num)
      unless /[1-7]/.match(num.to_s)
        raise ArgumentError.new("Please choose an integer between 1 and 7.")
      end

      unless @num_tiles_remaining > num
        raise ArgumentError.new("There are only #{@num_tiles_remaining}. remaining. Please draw #{@num_tiles_remaining} or fewer.")
      end

    end
  end
end
