module Scrabble

  class TileBag
    attr_reader :tiles

    LETTER_VALUES = { A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10 }.freeze

    LETTER_FREQUENCY = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }.freeze

    def initialize(tiles = [])
      # @tiles = LETTER_FREQUENCY.select {|k,v| true}
      # @tiles = LETTER_FREQUENCY.dup
      @tiles = tiles

      # if tiles not supplied (for testing), add tiles to tile bag
      if @tiles.length < 1
        LETTER_FREQUENCY.each do |letter, num_times|
          num_times.times { @tiles << letter.to_s }
        end
      end
    end

    def draw_tiles(num)
      # TODO check if tile bag empty && player has empty hand; if true, end game

      hand = []

      # check that tile bag isn't empty
      num = tiles_remaining if num > tiles_remaining

      num.times do
        # pick a random letter, add it to hand, and remove from tile bag
        letter = @tiles.sample
        hand << letter

        # get idx of letter, delete
        letter_idx = @tiles.index(letter)
        @tiles.delete_at(letter_idx)

      end

      return hand
    end

    def tiles_remaining
      return @tiles.length
    end
  end # end of TileBag class

end # end of module
