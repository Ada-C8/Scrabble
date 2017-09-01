module Scrabble
  class Tilebag
    attr_reader :tile_bag

    def initialize
      @tile_bag = ["i","o","p","u","y","t","r","e","w","q"]
    end

    def draw_tiles(number)
      # returns a collection of random tiles, removes the tiles from the default set
      tiles_for_player = []
      number.times do
        index = rand(@tile_bag.length)
        tiles_for_player << @tile_bag[index]
        @tile_bag.delete_at(index)
      end
      tiles_remaining
      return tiles_for_player
    end

    def tiles_remaining
      num_of_tiles = @tile_bag.length
      return num_of_tiles
    end

  end
end
