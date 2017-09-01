module Scrabble
  class Tilebag
    attr_reader :tile_bag

    def initialize
      @tile_bag = ["a","a","a","a","a","a","a","a","a",
        "b","b",
        "c","c",
        "d","d","d","d",
        "e","e","e","e","e","e","e","e","e","e","e","e",
        "f","f",
        "g","g","g",
        "h","h",
        "i","i","i","i","i","i","i","i","i",
        "j",
        "k",
        "l","l","l","l",
        "m","m",
        "n","n","n","n","n","n",
        "o","o","o","o","o","o","o","o",
        "p","p",
        "q",
        "r","r","r","r","r","r",
        "s","s","s","s",
        "t","t","t","t","t","t",
        "u","u","u","u",
        "v","v",
        "w","w",
        "x",
        "y","y",
        "z"]
    end

    def draw_tiles(number)
      # returns a collection of random tiles, removes the tiles from the default set
      tiles_for_player = []
      number.times do
        index = rand(@tile_bag.length)
        tiles_for_player << @tile_bag[index]
        @tile_bag.delete_at(index)
      end
      tiles_remaining
      return tiles_for_player
    end

    def tiles_remaining
      num_of_tiles = @tile_bag.length
      return num_of_tiles
    end

  end
end
