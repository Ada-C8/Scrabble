
module Scrabble
  class Scoring

    def initialized
    end

    def self.score(word)
      word = word.split("") #array
      score = 0
      word.each do |letter|
        case letter
        when "A", "a","E", "e", "I", "i", "O", "o", "U", "u", "L", "l", "N", "n", "R", "r", "S", "s", "T", "t"
          score += 1
        when "D", "d", "G", "g"
          score += 2
        when "B", "b", "C", "c", "M", "m", "P", "p"
          score += 3
        when "F", "f", "H", "h", "V", "v", "W", "w", "Y", "y"
          score += 4
        when "K", "k"
          score += 5
        when "J", "j", "X", "x"
          score += 8
        when "Q", "q", "Z", "z"
          score += 10
        else
          raise ArgumentError.new("Invalid Input for string!")

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
          fewest_letters = scores[max_score].min_by {|word| word.length} #returns the first intance of (a word with) length F, where F is fewest number of letters.

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
