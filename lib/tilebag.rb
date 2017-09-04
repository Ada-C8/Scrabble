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
        row[1].to_i.times do
          tile = row[0]
          @tiles << tile
        end
      end
    end

    def draw_tiles(num)
      if num == 0 || num > 7 || num.class != Integer
        raise ArgumentError.new("This is incorrect. Enter a number between 1 and 7.")
      end

      tiles_array = []
      num.times do
        @tiles.shuffle!
        tiles_array << @tiles.pop
      end
      return tiles_array
    end

    def tiles_remaining
      return @tiles.count
    end

  end #(end of class)
end #(end of module)
