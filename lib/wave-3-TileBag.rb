module Scrabble
  class TileBag
    attr_reader :original_tile_bag

    def initialize
      @original_tile_bag = [
        "A", "A", "A", "A", "A", "A", "A", "A", "A",
        "B", "B",
        "C", "C",
        "D", "D", "D", "D",
        "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
        "F", "F",
        "G", "G", "G",
        "H", "H",
        "I", "I", "I", "I", "I", "I", "I", "I", "I",
        "J",
        "K",
        "L", "L", "L", "L",
        "M", "M",
        "N", "N", "N", "N", "N", "N",
        "O", "O", "O", "O", "O", "O", "O", "O",
        "P", "P",
        "Q",
        "R", "R", "R", "R", "R", "R",
        "S", "S", "S", "S",
        "T", "T", "T", "T", "T", "T",
        "U", "U", "U", "U",
        "V", "V",
        "W", "W",
        "X",
        "Y", "Y",
        "Z"]
    end

    def draw_tiles(num)
      if @original_tile_bag.length < num
        raise ArgumentError.new "not enough tiles"
      end
      tiles = []
      num.times do
        letter = original_tile_bag.shuffle!.pop
        tiles << letter
      end
      return tiles
    end

    def tiles_remaining
      @original_tile_bag.length
    end

  end
end
