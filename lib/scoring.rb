module Scrabble

  class Scoring
    @point_values = {
      A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1,
      J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1,
      S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10
    }

    def self.score(string)
      if string.length > 7
        raise ArgumentError.new("Seven letter maximum.")
      end
      if string.length == 7
        total_score = 50
      else
        total_score = 0
      end
      string.each_char do |letter|
        if @point_values.key?(letter.upcase.to_sym) == true
          total_score += @point_values[letter.upcase.to_sym]
        end
      end
      return total_score
    end

    def self.highest_score_from(array)
      if array.class != Array
        raise ArgumentError.new("Must pass an array.")
      end
      unless array.length > 1
        raise ArgumentError.new("Needs at least two words to compare")
      end
      array.each do |i|
        if array[i].class != String
          raise ArgumentError.new("Can only compare strings")
        end
      end
    end
  end
end
