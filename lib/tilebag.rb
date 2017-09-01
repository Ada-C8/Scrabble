module Scrabble
  class TileBag
    def initialize
      tile_distribution = {
        "A" => 9,
        "B" => 2,
        "C" => 2,
        "D" => 4,
        "E" => 12,
        "F" => 2,
        "G" => 3,
        "H" => 2,
        "I" => 9,
        "J" => 1,
        "K" => 1,
        "L" => 4,
        "M" => 2,
        "N" => 6,
        "O" => 8,
        "P" => 2,
        "Q" => 1,
        "R" => 6,
        "S" => 4,
        "T" => 6,
        "U" => 4,
        "V" => 2,
        "W" => 2,
        "X" => 1,
        "Y" => 2,
        "Z" => 1
      }

      #  Here we push each letter as many times as it is
      #  in their value into an array called remaining_tiles
      # Example: A 9 times, B 2 times
      @remaining_tiles = []
      tile_distribution.each do |letter, quantity|
        quantity.times do
          @remaining_tiles << letter
        end
      end
    end

    def draw_tiles(num)
      tiles = []
      num.times do
        tile = @remaining_tiles.delete_at(rand(@remaining_tiles.length))
        tiles << tile
      end
      return tiles
    end

    def tiles_remaining
      return @remaining_tiles.length
    end
  end
end
