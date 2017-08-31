module Scrabble
  class Tilebag
    attr_reader :default_tiles, :tiles_remaining

    def initialize
      @default_tiles = {
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

      total_tiles = 0
      @default_tiles.each_value do |value|
        total_tiles += value
      end

      @tiles_remaining = total_tiles
    end

    def draw_tiles(num)
      #take num and remove that num from random key-value pairs, if value in pair is equal or greater to that num
      drawn_tiles = []

      num.times do |i|
        draw = @default_tiles.to_a.sample(1)
        drawn_tiles << draw[0][0]

        @default_tiles.each_key do |letter|
          if letter == draw[0][0]
            @default_tiles[letter] -= 1
            @default_tiles.delete_if {|key, value| value == 0}
          end
        end
      end


      @tiles_remaining -= num

      return drawn_tiles

    end




  end#Tilebag
end#Scrabble
