module Scrabble
  class Scoring

    TILE_SCORES = {
      "A"=>1,
      "E"=>1,
      "I"=>1,
      "O"=>1,
      "U"=>1,
      "L"=>1,
      "N"=>1,
      "R"=>1,
      "S"=>1,
      "T"=>1,
      "D"=>2,
      "G"=>2,
      "B"=>3,
      "C"=>3,
      "M"=>3,
      "P"=>3,
      "F"=>4,
      "H"=>4,
      "V"=>4,
      "W"=>4,
      "Y"=>4,
      "K"=>5,
      "J"=>8,
      "X"=>8,
      "Q"=>10,
      "Z"=>10}

      def self.score(word)
        letters = word.upcase.split(//)
        score = 0
        letters.each do |letter|
          score += TILE_SCORES[letter]
        end
        if letters.length == 7
          score += 50
        end
        return score
      end

      def self.highest_score_from_array(array_of_words)
        max_score = [0,0, ""]
        array_of_words.each do |word|
          if self.score(word) > max_score[0]
            max_score = [self.score(word), word.length, word]
          elsif self.score(word) == max_score[0]
            if word.length == 7
              max_score = [self.score(word), word.length, word]
            elsif max_score[1] > word.length
              max_score = [self.score(word), word.length, word]
            end
          end
        end
        return max_score[2]
      end

  end # end class
end # end module
