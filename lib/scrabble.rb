module Scrabble
  class Scoring

    def self.score(word)
      # string
      split_word = word.split(//)
      value = 0
      split_word.each do |letter|
        case letter
        when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
          value += 1
        when "d", "g"
          value += 2
        when "b", "c", "m", "p"
          value += 3
        when "f", "h", "v", "w", "y"
          value += 4
        when "k"
          value += 5
        when "j", "x"
          value += 8
        when "q", "z"
          value += 10
        end
      end
      return value
    end


    def self.highest_score_from(array_of_words)
      #array of strings
      # calls to score method, word by word
      return array_of_words
    end
  end
end
