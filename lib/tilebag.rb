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
      @default_tiles = []
      hash_tiles.keys.each do |key|
        hash_tiles[key].times do
          @default_tiles << key
        end
      end

      # outputs the number of tiles left in bag
      @tiles_remaining = @default_tiles.length
    end

    def draw_tiles(num)
      #take num and remove that num from random key-value pairs, if value in pair is equal or greater to that num
      sample_tiles = @default_tiles.sample(num)
      sample_tiles.each do |letter|
        @default_tiles.delete(letter)
      end
      @tiles_remaining -= num
      return sample_tiles

      # Option 2: for default_tiles
#       5.times do |i|
#   letter = hash.keys.sample
#   draw = letter
#   # draw = hash.to_a.sample.to_h
#   print "The draw is #{draw}"
#   puts
#
#   # if a has value decrement by 1 and add to drawn tiles
#  if hash[draw] > 0
#   drawn_tiles << draw
#   hash[draw] -= 1
# end
  # otherwise a does not have value ask user to draw again.
  #sample = h.keys.sample
  #h.select { |k,v| k == sample }


      # Anders code, we may use later.
      # num.times do |i|
      #   draw = @default_tiles.to_a.sample(1)
      #   drawn_tiles << draw[0][0]
      #
      #   @default_tiles.each_key do |letter|
      #     if letter == draw[0][0]
      #       @default_tiles[letter] -= 1
      #       @default_tiles.delete_if {|key, value| value == 0}
      #     end
      #   end
      # end

    end




  end#Tilebag
end#Scrabble
