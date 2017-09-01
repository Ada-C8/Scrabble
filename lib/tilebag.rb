module Scrabble
  class TileBag
    attr_reader :remaining_tiles

    def initialize
      @remaining_tiles = {
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

      
    end

    def draw_tiles(num)
      tiles = []
      num.times do
        tile = @remaining_tiles.keys.sample
		until @remaining_tiles[tile] != 0  
			tile = @remaining_tiles.keys.sample
		end
		@remaining_tiles[tile] -= 1	
        tiles << tile
      end
      return tiles
    end

    def tiles_remaining
	  sum = 0
	  @remaining_tiles.keys.each do |key, value|
		sum += value
	  end
      return sum
    end
  end
end
