require 'awesome_print'
module Scrabble
  class TileBag

    attr_reader :bag_of_tiles

    def initialize
      @bag_of_tiles = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }
    end

    def draw_tiles(num)
      tiles_drawn = []
      draw = @bag_of_tiles.keys.to_a.sample


      tiles_drawn << draw
      return tiles_drawn
    end

  end
end

trying_this = Scrabble::TileBag.new
tiles = trying_this.draw_tiles(5)
ap "#{tiles}"
