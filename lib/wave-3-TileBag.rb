module Scrabble
  class TileBag
    attr_reader :original_tile_bag

    TILE_SET = {
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

    def initialize
      @original_tile_bag = TILE_SET.clone
    end

    def draw_tiles(num)
      if @original_tile_bag.values.inject(&:+) < num
        raise ArgumentError.new "not enough tiles"
      end
      tiles = []
      num.times do
        tiles << draw_tile
      end
      return tiles
    end

    def draw_tile
      letter_qty = 0

      while letter_qty < 1
        letter = original_tile_bag.keys.sample
        letter_qty = @original_tile_bag[letter]
      end

      @original_tile_bag[letter] -= 1
      return letter
    end

    def tiles_remaining
      @original_tile_bag.values.inject(&:+)
    end

  end
end
