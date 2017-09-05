module Scrabble
  class TileBag
    attr_reader :letter_quantity
    def initialize
      @letter_quantity = {
        A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9,
        J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6,
        S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1
      }
    end

    def draw_tiles(num)
      quantity_array = @letter_quantity.to_a
      tile_selection = []

      quantity_array.sample(num).each do |letter_pair|
        tile_selection << letter_pair[0]
        if letter_pair[1] == 1 #If you drew the last tile of that letter, letter no longer available
          letter_pair[0] = "remove"
        end
        letter_pair[1] -= 1
      end
      quantity_array.reject! {|pair| pair[0] == "remove"}
      @letter_quantity = quantity_array.to_h
      return tile_selection #returns an array of symbols
    end

    def tiles_remaining
      @letter_quantity.sum {|letter, quantity| quantity}
    end
  end
end
