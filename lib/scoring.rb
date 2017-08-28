module Scrabble

  class Scoring

    def self.score(word)
      letter_values = { A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10 }

      # iterate through string, and get vals for each char in word
      score = 0
      word.upcase!

      word.each_char do |letter|
        score += letter_values[letter.to_sym]
      end

      if word.length >= 7
        score += 50
      end

      return score
    end

    def self.highest_score_from_array(array_of_words)
      high = array_of_words.max_by { |word| self.score(word) }

      high_score = self.score(high)

      array_of_words.each do |word|
        if (self.score(word) == high_score) && (word.length < high.length)
          high = word
        end
      end

      return high

    end


  end # end of Scoring class

end

# words = ["fantastically", "cat", "scrabble", "peanuts", "spy"]
#
# words.each do |word|
#   score = Scrabble::Scoring.score(word)
#   puts "#{word} value is #{score}"
# end
