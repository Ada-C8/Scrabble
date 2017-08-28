module Scrabble
  class Scoring
    @point_values = {
      A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1,
      J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1,
      S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10
    }
    def self.score(string)
      total_score = 0

      string.each_char do |letter|
        if @point_values.key?(letter.upcase.to_sym) == true
          total_score += @point_values[letter.upcase.to_sym]
        end
      end
      return total_score
    end
  end
end
