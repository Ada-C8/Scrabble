module Scrabble
  class TileBag
    TILES_COUNT = {'A' => 9, 'B' => 2, 'C' => 2, 'D' => 4, 'E' => 12, 'F' => 2,
      'G' => 3, 'H' => 2, 'I' => 9, 'J' => 1, 'K' => 1, 'L' => 4,
      'M' => 2, 'N' => 6, 'O' => 8, 'P' => 2, 'Q' => 1, 'R' => 6,
      'S' => 4, 'T' => 6, 'U' => 4, 'V' => 2, 'W' => 2, 'X' => 1,
      'Y' => 2, 'Z' => 1
    }

    attr_reader :bag

    def initialize
      @bag = []

      TILES_COUNT.each do |letter, count|
        count.times do
          @bag << letter
        end
      end

    end


    def draw_tiles(num)
      #draw_tiles(num) returns a collection of random tiles, removes the tiles from the default set
    end

    def tiles_remaining(num)

    end
    #tiles_remaining returns the number of tiles remaining in the bag

  end # end of class
end # end of module
