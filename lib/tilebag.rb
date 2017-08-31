# require_relative "player"
# require_relative "scoring"

module Scrabble
  class TileBag

    attr_reader :default_tiles, :tiles_remaining, :tile_bag


    def initialize
      @default_tiles = {
        'a' => 9,
        'b' => 2,
        'c' => 2,
        'd' => 4,
        'e' => 12,
        'f' => 2,
        'g' => 3,
        'h' => 2,
        'i' => 9,
        'j' => 1,
        'k' => 1,
        'l' => 4,
        'm' => 2,
        'n' => 6,
        'o' => 8,
        'p' => 2,
        'q' => 1,
        'r' => 6,
        's' => 4,
        't' => 6,
        'u' => 4,
        'v' => 2,
        'w' => 2,
        'x' => 1,
        'y' => 2,
        'z' => 1
      }
      @tiles_remaining = 98
    end


    def draw_tiles(num)
      tiles_drawn = @default_tiles.keys.sample(num)
      tiles_drawn.each do |drawn_tile|
        @default_tiles[drawn_tile] -= 1
      end
      @tiles_remaining -= tiles_drawn.length
      return tiles_drawn
    end
  end
end




# test = Scrabble::TileBag.new
# puts test.draw_tiles(7)

# puts test.tilebag
