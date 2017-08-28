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
      else
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
      return this_score
    end


  end
end
