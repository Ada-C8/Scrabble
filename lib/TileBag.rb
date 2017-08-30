module Scrabble

  class TileBag
    attr_reader :available_tiles

    def initialize
      @available_tiles = {
        "a" => 9,
        "b" => 2,
        "c" => 2,
        "d" => 4,
        "e" => 12,
        "f" => 2,
        "g" => 3,
        "h" => 2,
        "i" => 9,
        "j" => 1,
        "k" => 1,
        "l" => 4,
        "m" => 2,
        "n" => 6,
        "o" => 8,
        "p" => 2,
        "q" => 1,
        "r" => 6,
        "s" => 4,
        "t" => 6,
        "u" => 4,
        "v" => 2,
        "w" => 2,
        "x" => 1,
        "y" => 2,
        "z" => 1
      }
    end

    def draw_tiles(num)
      drawn = []
      until drawn.length == num
        letter = @available_tiles.keys.sample
        if @available_tiles[letter] > 0
          drawn << letter
          @available_tiles[letter] -= 1
          @available_tiles.delete(letter) if @available_tiles[letter] == 0
        end
      end
      return drawn
    end

    def tiles_remaining
      return @available_tiles.values.sum
    end

  end # TileBag class
end # Scrabble Module
