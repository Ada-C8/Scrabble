module Scrabble
  class TileBag

    attr_reader :tiles, :remaining_tiles

    def initialize

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
      # @tiles = draw_tiles
    end #end initialize

    def draw_tiles(num)
      tile_hand = []
      if @remaining_tiles.length == 0
        puts "No tiles left"
      elsif @remaining_tiles.length < num
        @remaining_tiles.each do |tile|
          tile_hand << tile
        end
      else

        num.times{  tile_hand << @remaining_tiles.delete_at(0) }
        tile_hand
      end
    end#end draw_tiles

    def tiles_remaining
      @remaining_tiles.length
    end

  end #end class
end #end module
