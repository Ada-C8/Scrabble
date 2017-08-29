module Scrabble
  class Scoring
    SCORE_CHART = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]
    }

    def initialize

    end

    def self.score(word)

      unless word.class == String
        raise ArgumentError.new("Input must be a String")
      end

      word_caps = word.upcase
      word_arr = word_caps.split("")

      total_score = 0

      word_arr.each do |letter_from_user|
        SCORE_CHART.each do |score, letter_arr|
          letter_arr.each do |letter|
            if letter_from_user == letter
              total_score += score
            end
          end
        end
      end

      if word_arr.length == 7
        total_score += 50
      end

      return total_score
    end

    def self.highest_score_from_array
    end

  end # class
end # module
