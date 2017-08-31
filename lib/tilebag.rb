module Scrabble
  class Tilebag
    attr_reader :tiles

    def initialize
      @tiles = ['A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'D', 'D', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'F', 'F', 'G', 'G', 'G', 'H', 'H', 'I', 'I', 'I', 'I', 'I', 'I', 'I', 'I', 'I', 'J', 'K', 'L', 'L', 'L', 'L', 'M', 'M', 'N', 'N', 'N', 'N', 'N', 'N', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'P', 'P', 'Q', 'R', 'R', 'R', 'R', 'R', 'R', 'S', 'S', 'S', 'S', 'T', 'T', 'T', 'T', 'T', 'T', 'U', 'U', 'U', 'U', 'V', 'V', 'W', 'W', 'X', 'Y', 'Y', 'Z']
    end


    def draw_tiles(num)
      raise ArgumentError.new("You must draw 1 or more tiles") if num < 1
      index_array = []
      picked_tiles = []

      num.times do
        index_array << rand(@tiles.length)
        #Another way to do this:
        #index_array << @tiles.index(@tiles.sample)
      end

      index_array.each do |index|
        picked_tiles << @tiles[index]
      end

      index_array.each do |index|
        @tiles.delete_at(index)
      end



      # picked_tiles = []
      # num.times do
      #   picked_tiles << @tiles.sample
      # end
      # num.times do
      #   picked_tiles << @tiles.delete(@tiles.sample)
      # end
      # picked_tiles.each do |tile|
      #   @tiles.delete_at(@tiles.index(tile))
      # end
      # return picked_tiles
    end
  end
end
