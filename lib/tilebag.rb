module Scrabble
  class TileBag

    attr_reader :tiles

    def initialize
      @tiles = {
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
      tiles_remaining < num ? num = tiles_remaining : num

      available_tiles = tiles.to_a
      tiles_drawn = []

      num.times do
        available_tiles.shuffle!
        tile = available_tiles.find { |letter, num_remaining| num_remaining > 0 }[0]
        tiles[tile] -= 1
        tiles_drawn << tile
      end

      tiles_drawn
    end

    def tiles_remaining
      tiles.values.inject(0, :+)
    end
  end
end
