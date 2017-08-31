require 'csv'
require_relative 'scoring'
require_relative 'player'

module Scrabble
  class TileBag
    attr_reader :tiles

    def initialize
      @tiles = []
      create_tilebag
    end

    def create_tilebag
      CSV.open('tiles.csv', "r").each do |row|
        tile = {row[0] => row[1]}
        @tiles << tile
      end
    end

    def draw_tiles(num)
      num.times do
        tiles_array << @tiles.sample
      end

    end


    ##draw_tiles(num) returns a collection of random tiles, removes the tiles from the default set







  end #(end of class)
end #(end of module)
