module Scrabble
  class Scoring

    def self.score(word)
      if word.class != String || !word.match?(/^[A-z]*$/) || word.length == 0
        raise ArgumentError.new("Value passed in doesn't contain only letters from A-Z")
      end
      word = word.upcase
      word_score = 0
      letters_equivalent_score = {
        1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2 => ["D", "G"],
        3 => ["B", "C", "M", "P"],
        4 => ["F", "H", "V", "W", "Y"],
        5 => ["K"],
        8 => ["J", "X"],
        10 => ["Q", "Z"]
      }
      # Add 50 points if the word is 7 letters
      word_score += 50 if word.length == 7
      word.each_char do |letter|
        letters_equivalent_score.each do |points, letters|
          word_score += points if letters.include?(letter)
        end
      end
      return word_score
    end


  end
end
