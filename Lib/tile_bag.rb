require_relative 'scrabble'
require 'pry'
# module Scrabble
#   # TOTAL_TILES = [
#   #   ["A"] * 9,
#   #   ["B"] * 2,
#   #   ["C"] * 2,
#   #   ["D"] * 4,
#   #   ["E"] * 12,
#   #   ["F"] * 2,
#   #   ["G"] * 3,
#   #   ["H"] * 2,
#   #   ["I"] * 9,
#   #   ["J"] * 1,
#   #   ["K"] * 1,
#   #   ["L"] * 4,
#   #   ["M"] * 2,
#   #   ["N"] * 6,
#   #   ["O"] * 8,
#   #   ["P"] * 2,
#   #   ["Q"] * 1,
#   #   ["R"] * 6,
#   #   ["S"] * 4,
#   #   ["T"] * 6,
#   #   ["U"] * 4,
#   #   ["V"] * 2,
#   #   ["W"] * 2,
#   #   ["X"] * 1,
#   #   ["Y"] * 2,
#   #   ["Z"] * 1
#   # ].flat_map{|tile_array| tile_array}

  class TileBag

    attr_reader :tiles, :remaining_tiles

    def initialize
      @tiles = draw_tiles
      @remaining_tiles = [
        ["A"] * 9,
        ["B"] * 2,
        ["C"] * 2,
        ["D"] * 4,
        ["E"] * 12,
        ["F"] * 2,
        ["G"] * 3,
        ["H"] * 2,
        ["I"] * 9,
        ["J"] * 1,
        ["K"] * 1,
        ["L"] * 4,
        ["M"] * 2,
        ["N"] * 6,
        ["O"] * 8,
        ["P"] * 2,
        ["Q"] * 1,
        ["R"] * 6,
        ["S"] * 4,
        ["T"] * 6,
        ["U"] * 4,
        ["V"] * 2,
        ["W"] * 2,
        ["X"] * 1,
        ["Y"] * 2,
        ["Z"] * 1
      ].flat_map{|tile_array| tile_array}.shuffle

    end #end initialize

    def draw_tiles
      tile_hand = []
      binding.pry
      raise ArgumentError.new("Not Enough Tiles!") if @remaining_tiles.length < 7

      7.times { tile_hand << @remaining_tiles.delete_at[0] }

      tile_hand
      binding.pry

    end#end draw_tiles
  end #end class
end #end module

spaghetti = Scrabble::TileBag.new
