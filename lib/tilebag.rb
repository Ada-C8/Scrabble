module Scrabble
  class TileBag
    attr_reader :bag

    TILES_COUNT = { 'A' => 8, 'B' => 2, 'C' => 2, 'D' => 4, 'E' => 12, 'F' => 2,
                    'G' => 3, 'H' => 2, 'I' => 9, 'J' => 1, 'K' => 1, 'L' => 4,
                    'M' => 2, 'N' => 6, 'O' => 8, 'P' => 2, 'Q' => 1, 'R' => 6,
                    'S' => 4, 'T' => 6, 'U' => 4, 'V' => 2, 'W' => 2, 'X' => 1,
                    'Y' => 2, 'Z' => 2 }.freeze

    def initialize
      @bag = []

      TILES_COUNT.each do |letter, count|
        count.times do
          @bag << letter
        end
      end
    end

    def draw_tiles(num)
      if num > tiles_remaining
        raise(ArgumentError, 'There are not enough tiles remaining in the bag!')
      end
      draw = @bag.sample(num)
      draw.each do |letter|
        @bag.delete_at(@bag.index(letter))
      end
      draw
    end

    def tiles_remaining
      @bag.length
    end
  end # end of class
end # end of module
