
module Scrabble

  class Scoring
    @point_values = {
      A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1,
      J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1,
      S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10
    }

    def self.score(string)
      raise ArgumentError.new("Seven letter maximum.") if string.length > 7
      string.length == 7 ? total_score = 50 : total_score = 0
      string.each_char do |letter|
        if @point_values.key?(letter.upcase.to_sym)
          total_score += @point_values[letter.upcase.to_sym]
        end
      end
      return total_score
    end

    def self.highest_score_from(array)
      raise ArgumentError.new("Must pass an array.") if array.class != Array
      raise ArgumentError.new("Needs at least two words to compare") unless array.length > 1 #Should it just return the one?
      raise ArgumentError.new("Can only compare strings") if array.any? {|element| element.class != String}

      scores = array.map { |word| score(word) }
      if scores.length == scores.uniq.length # Indicates no score ties
        array.inject do|winner, word|
          score(winner) >= score(word) ? winner : word # Return highest scoring word
        end
      else # In case of ties:
        high_score = scores.max
        array.reject! {|word| score(word) < high_score} # Remove lower scoring words from collection
        array.each { |word|return word if word.length == 7 } # First 7-letter high-scorer wins
        return array.min_by {|word| word.length} # If no 7-letter high-scorer, shortest high-scorer wins
      end
    end
  end
end
