module Scrabble
  class Tilebag
    attr_reader :default_tiles, :tiles_remaining

    def initialize
      hash_tiles = {
        A: 9,
        B: 2,
        C: 2,
        D: 4,
        E: 12,
        F: 2,
        G: 3,
        H: 2,
        I: 9,
        J: 1,
        K: 1,
        L: 4,
        M: 2,
        N: 6,
        O: 8,
        P: 2,
        Q: 1,
        R: 6,
        S: 4,
        T: 6,
        U: 4,
        V: 2,
        W: 1,
        X: 1,
        Y: 2,
        Z: 1
      }
      # Flattens hash into one array filled with all the letters.
      # convert symbols to strings
      @default_tiles = []
      hash_tiles.keys.each do |key|
        hash_tiles[key].times do
          @default_tiles << key.to_s
        end
      end

      # outputs the number of tiles left in bag
      @tiles_remaining = @default_tiles.length
    end

    def draw_tiles(num)
      #take num and remove that num from random key-value pairs, if value in pair is equal or greater to that num

      unless num <= @default_tiles.length
        raise ArgumentError.new("Not enough tiles, game over")
      end

      sample_tiles = @default_tiles.sample(num)
      sample_tiles.each do |letter|
        @default_tiles.delete_at(@default_tiles.find_index(letter))
      end
      @tiles_remaining -= num
      return sample_tiles
    end

  end#Tilebag
end#Scrabble
