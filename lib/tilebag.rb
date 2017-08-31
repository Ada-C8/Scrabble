require_relative 'scrabble'

module Scrabble
  class TileBag
    attr_reader :tiles, :tiles_remaining

    def initialize
      @tiles = {A: 9, N: 6, B: 2, O: 8, C: 2, P: 2 , D: 4, Q: 1, E: 12, R: 6, F: 2, S: 4, G: 3, T: 6, H: 2, U: 4, I: 9, V: 2, J: 1, W: 2, K: 1, X: 1, L: 4, Y: 2, M: 2, Z: 1}
    end

#talk to someone about private methods for executing the wave2 file

    def draw_tiles(num)
      all_tiles = []
      @tiles.each do |k,v|
        all_tiles << k.to_s * v
      end
      #create random pull from all tiles
      #make sure to decrement value from @tiles
      
    end

    def tiles_remaining
      return @tiles.values.inject(:+)
    end

  end
end
  p Scrabble::TileBag.new.tiles[:A]
