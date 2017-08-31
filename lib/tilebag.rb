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







  end #(end of class)
end #(end of module)
