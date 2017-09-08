module Scrabble
  class TileBag
    attr_reader :letter_quantity

    def initialize
      @letter_quantity = {A:9, B:2, C:2, D:4, E:12, F:2, G:3, H:2, I:9, J:1, K:1,
         L:4, M:2, N:6, O:8, P:2, Q:1, R:6, S:4, T:6, U:4, V:2, W:2, X:1, Y:2, Z:1}
    end

    def draw_tiles(num)
      tiles = []
      # array to store the tiles to return to the user
      if num > tiles_remaining
        return nil
      else
        while tiles.length != num
          random = rand(@letter_quantity.size)
          i = 0
          @letter_quantity.each do |key, value|
            if i == random
              if value != 0
                tiles << key
                @letter_quantity[key] = value - 1
              else
                random = rand(@letter_quantity.size)
              end
            end
            i += 1
          end
        end
        return tiles
      end
    end

    def tiles_remaining
      return @letter_quantity.inject(0) { |sum, i| sum += i[1] }
    end

  end #end of class
end #end of module


  ##TESTING####
  # tile_bag = Scrabble::TileBag.new
  # tile_bag.draw_tiles(num)
