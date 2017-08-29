module Scrabble
  class Scoring

    def self.score(word)
      if word.class != String || !word.match?(/^[A-z]*$/) || word.length == 0 || word.length > 7
        raise ArgumentError.new("Value passed in doesn't contain only letters from A-Z")
      end
      word = word.downcase
      word_score = 0
      letters_equivalent_score = {
        1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
        2 => ["d", "g"],
        3 => ["b", "c", "m", "p"],
        4 => ["f", "h", "v", "w", "y"],
        5 => ["k"],
        8 => ["j", "x"],
        10 => ["q", "z"]
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
