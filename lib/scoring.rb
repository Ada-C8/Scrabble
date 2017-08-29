
module Scrabble
  class Scoring

    def initialized
    end

    def self.score(word)
      word = word.upcase.split("") #array
      score = 0
      word.each do |letter|
        case letter
        when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
          score += 1
        when "D", "G"
          score += 2
        when "B", "C", "M", "P"
          score += 3
        when "F", "H", "V", "W", "Y"
          score += 4
        when "K"
          score += 5
        when "J", "X"
          score += 8
        when "Q", "Z"
          score += 10
        else
          raise ArgumenError.new("Invalide Input !")
        end
      end
      if word.length == 7
        score += 50
      end
      return score
    end

    def self.highest_score_from_array(array_of_words)
      scores = array_of_words.group_by {|word| score(word)}
      #this returns a hash, where keys are scores, and value is an array of words

      max_score = scores.keys.max
      #returns array of keys, calls .max to find highest value keys

      #checks length of value(array of words) of key(max_score)
      if scores[max_score].length == 1
        scores[max_score].first
      else
        seven_letters = scores[max_score].select {|word| word.length == 7} #this is an array
        if seven_letters.length >= 1 #if there are any with 7 letters
          return seven_letters.first #return the first one
        else
          fewest_letters = score[max_score].min_by {|word| word.length} #returns the first intance of (a word with) length F, where F is fewest number of letters.

          return fewest_letters
        end
      end

    end
  end

end

#
# point_one = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
# point_two = ["D", "G"]
# point_three = ["B", "C", "M", "P"]
# point_four = ["F", "H", "V", "W", "Y"]
# point_five = ["K"]
# point_eight = ["J", "X"]
# point_ten = ["Q", "Z"]
