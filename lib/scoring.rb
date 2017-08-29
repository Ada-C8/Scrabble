module Scrabble

  class Scoring

    def initialize

    end#Initialize

    def self.score(word)
      all_values = {
        "A" => 1,
        "B" => 3,
        "C" => 3,
        "D" => 2,
        "E" => 1,
        "F" => 4,
        "G" => 2,
        "H" => 4,
        "I" => 1,
        "J" => 8,
        "K" => 5,
        "L" => 1,
        "M" => 3,
        "N" => 1,
        "O" => 1,
        "P" => 3,
        "Q" => 10,
        "R" => 1,
        "S" => 1,
        "T" => 1,
        "U" => 1,
        "V" => 4,
        "W" => 4,
        "X" => 8,
        "Y" => 4,
        "Z" => 10,
      }
      word = word.upcase
      score = 0

      word.split('').each do |l|
        score += all_values[l]
      end

      #return score
      if word.length == 7
        return score + 50
      else
        return score
      end
    end #end self.score

    def self.highscore_from(array_of_words)
      scores = []
      array_of_words.each do |word|
        scores << self.score(word)
      end
      return max = scores.max
      #return scores
    end

  end #class end


end #module end
