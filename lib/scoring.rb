module Scrabble
  class Scoring
    POINTS = { 'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2, 'E' => 1, 'F' => 4,
               'G' => 2, 'H' => 4, 'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
               'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3, 'Q' => 10, 'R' => 1,
               'S' => 1, 'T' => 1, 'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
               'Y' => 4, 'Z' => 10 }

    def self.score(word)
      if word.class != String
        raise(ArgumentError, "Input must be String: #{word}")
      end
      word = word.upcase.split('')
      total_score = 0

      if word.length == 7
        total_score += 50
      end

      word.each do |letter|
        total_score += POINTS[letter]
      end
      total_score
    end # end of self.score

    def self.highest_score_from(array_of_words)
      if array_of_words.empty?
        raise(ArgumentError, 'Invalid empty array')
      end
      best_word = array_of_words[0]
      array_of_words.each do |word|
        if score(word) == score(best_word)
          best_word = handle_tie(best_word, word)
        elsif score(word) > score(best_word)
          best_word = word
        end
      end
      best_word
    end # end of self.highest_score

    def self.handle_tie(word1, word2)
      if word1.length == 7
        word1
      elsif word2.length == 7
        word2
      elsif word2.length < word1.length
        word2
      else
        word1
      end
    end # end of handle_tie
  end # end of Scoring class
end # end of module
