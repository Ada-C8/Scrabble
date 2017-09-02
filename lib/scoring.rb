module Scrabble
  class Scoring

    TILES = {"A" => 1, "E" =>1, "I"=> 1, "O"=>1, "L" => 1, "N" => 1, "R" => 1,
       "U" => 1,"S" => 1, "T" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3,
       "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4,
       "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10 }

    def self.score(word)
      value = 0
      word.upcase.each_char do |letter|
        value += TILES[letter]
      end
      if word.length == 7
        value += 50
      end
      return value
    end

    def self.highest_score_from(array_of_words)
      max = 0
      highest_score_word = ''
      array_of_words.each do |word|
        if self.score(word) > max
          max = self.score(word)
          highest_score_word = word
        elsif self.score(word) == max
          if word.length < highest_score_word.length
            highest_score_word = word
          end
        end
      end
      return highest_score_word
    end
  end #end of class
end #end of module

  ####TESTING######

  #Scoring.highest_score_from(["cat", "eggs", "bread", "rank"])
  #Scoring.highest_score_from(["cat", "eggs", "bread", "blank"])
  # Scoring.score("cat")
