module Scrabble



  class TileBag
    attr_reader :tiles

    LETTER_VALUES = { A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10 }.freeze

    LETTER_FREQUENCY = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }.freeze

    def initialize
      # @tiles = LETTER_FREQUENCY.select {|k,v| true}
      @tiles = LETTER_FREQUENCY.dup
    end

    def draw_tiles(num)
      # TODO check if tile bag empty && player has empty hand; if true, end game
      
      hand = []

      # check that tile bag isn't empty
      num = tiles_remaining if num > tiles_remaining

      num.times do
        # pick a random letter
        letter = ('A'..'Z').to_a.sample

        # if letter not avail, pick another letter
        while @tiles[letter.to_sym] == 0
          letter = ('A'..'Z').to_a.sample
        end

        # add letter to hand; remove from @tiles
        hand << letter
        @tiles[letter.to_sym] -=1
      end

      return hand
    end

    def tiles_remaining
      return @tiles.values.sum
    end
  end # end of TileBag class

end # end of module
