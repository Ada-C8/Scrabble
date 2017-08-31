module Scrabble
  class TileBag

    attr_reader :tile_array

    def initialize
      tile_hash = {
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
      @tile_array = []

      tile_hash.each do |key, quantity|
        quantity.times do
          @tile_array << key
        end
      end
      @tile_array
    end #initialize

    def draw_tiles(num)
      @tile_array.shuffle!
      # if num >@tile_array.length
      #   raise ArgumentError.new("We don't have that amount of letters")
      # else
         return @tile_array.shift(num)
      # end
    end

    def tiles_remaining
      return @tile_array.length
    end


  end #class

end #module
