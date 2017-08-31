
module Scrabble
  class Tilebag

    attr_reader :num_tiles_remaining, :tilebag

    def initialize
      @tilebag = {a: 9, b:2, c:2, d:4, e:12, f:2, g:3, h:2, i:9, j:1, k:1, l:4, m:2, n:6, o:8, p:2, q:1, r:6, s:4, t:6, u:4, v:2, w:2, x:1, y:2, z:1}

      @num_tiles_remaining = 107
    end

    def draw_tiles(num)
      raise ArgumentError.new("Number must be an integer less than 8.") unless /^[0-7]$/.match(num)

      letter = @tilebag.keys.sample

      @tilebag[letter] -= 1
      @tilebag.delete_if {|key,value| value == 0}
    end



  end
end
