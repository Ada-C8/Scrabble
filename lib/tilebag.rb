module Scrabble
  class Tilebag
    attr_reader :tiles_remaining
    TILES = {
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
      @bag = []
      TILES.each do |key,value|
        value.times {@bag.push(key)}
      end
      @bag.shuffle!
      update_tiles
    end

    def draw_tiles(input_num)
      grab = []
      input_num.times do
        grab << @bag[0]
        @bag.delete_at(0)
      end
      update_tiles
      return grab
    end

    private
    def update_tiles
      @tiles_remaining = @bag.length
    end

  end # => end of class
end # => end of module
