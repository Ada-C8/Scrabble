module Scrabble
  class Scoring
    def self.score(word)
      score_chart = {
        1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2 => ["D","G"],
        3 => ["B", "C", "M", "P"],
        4 => ["F", "H", "V", "W", "Y"],
        5 => ["K"],
        8 => ["J", "X"],
        10 => ["Q","Z"]
      }

      if word.class != String
        raise ArgumentError.new("You did not enter a string for the word being scored.")
      elsif word.length > 7
        raise ArgumentError.new("You cannot enter a word greater than 7 letters!")
      else
        word.upcase!
        this_score = 0
        word.length.times do |index|
          score_chart.each do |point, score_letters|
            score_letters.each do |score_letter|
              if score_letter == word[index]
                this_score += point
              end
            end
          end
        end
      end
      if word.length == 7
        return this_score + 50
      else
        return this_score
      end
    end

    def self.highest_score_from(array_of_words)
      arrays_of_scores = []
      array_of_words.each do |word|
        arrays_of_scores << self.score(word)
      end
      highest_score = arrays_of_scores.max
      index_of_highest_score = arrays_of_scores.index(highest_score)

      return array_of_words[index_of_highest_score]
    end

  end
end
