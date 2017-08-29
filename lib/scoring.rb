module Scrabble
  class Scoring

    LETTER_SCORES = {
      1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
      2 => ["d", "g"],
      3 => ["b", "c", "m", "p"],
      4 => ["f", "h", "v", "w", "y"],
      5 => ["k"],
      8 => ["j", "x"],
      10 => ["q", "z"]
    }

    def self.score(word)
      unless word.class == String && word.match?(/^[A-z]+$/)
        raise ArgumentError.new("Value passed in doesn't contain only letters from A-Z")
      end
      if word.length > 7
        raise ArgumentError.new("You can only have words up to 7 letters.")
      end

      word = word.downcase
      word_score = 0
      # Add 50 points if the word is 7 letters
      word_score += 50 if word.length == 7
      word.each_char do |letter|
        LETTER_SCORES.each do |points, letters|
          word_score += points if letters.include?(letter)
        end
      end
      return word_score
    end

    def self.highest_score_from(word_array)
      word_scores = word_array.map { |word| [Scoring.score(word), word.downcase] }

      high_score = word_scores.max_by { |word_score| word_score[0] }

      winning_words = word_scores.select { |word_score| word_score[0] == high_score[0] }
      puts winning_words
      if winning_words.length > 1
        return winning_words.min_by { |win_word| win_word[1].length }[1]
      else
        return winning_words[0][1]
      end
    end
  end
end
