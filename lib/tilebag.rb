require 'pry'

module Scrabble
  class TileBag
    attr_reader :all_tiles

    def initialize
      @all_tiles = {
        A:9, B:2, C:2, D:4, E:12, F:2, G:3, H:2, I:9, J:1, K:1, L:4, M:2, N:6, O:8, P:2, Q:1, R:6, S:4, T:6, U:4, V:2, W:2, X:1, Y:2, Z:1
      }
    end

    def tiles_remaining
      @all_tiles.values.reduce(:+)
    end

    def draw_tiles(num)
      letters = []
      num.times do
        choice = @all_tiles.keys.sample
        letters << choice.to_s
        @all_tiles[choice] -= 1
      end
      return letters
    end


  end

end
