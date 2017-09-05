
module Scrabble
  class Scoring
    def initialized
    end

    def self.score(word)
      unless /^([a-zA-Z]){1,7}$/.match(word.to_s)
        raise ArgumentError.new("Invalid word!")
      end

      word = word.upcase.split("") #array
      score = 0
      word.each do |letter|
        case letter
        when "A","E", "I", "O", "U", "L", "N", "R", "S", "T"
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
          raise ArgumentError.new("Invalid input for string!")
        end
      end

      if word.length == 7
        score += 50
      end
      return score
    end


    def self.highest_score_from_array(array_of_words)
      if array_of_words.empty?
        return "None!"
      end

      scores = array_of_words.group_by {|word| score(word)}
      #returns a hash, key==scores, value==array of words

      max_score = scores.keys.max
      #returns keys_array, finds max

      #checks length of value(array of words) of key(max_score)
      if scores[max_score].length == 1
        scores[max_score].first
      else
        seven_letters = scores[max_score].select {|word| word.length == 7} #this is an array
        if seven_letters.length >= 1 #if there are any with 7 letters
          return seven_letters.first #return the first one
        else
          fewest_letters = scores[max_score].min_by {|word| word.length}
          #returns the first intance of (a word with) length F, where F is fewest number of letters.
          return fewest_letters
        end
      end
    end
  end #end of class
end #end of module
