
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
      #IF there's a tie && word.lenghts ==
      #take the first word
      #If there's a tie and words !=, take the shortest one unless one of them has 7 tiles

      # score_total = []
      # array_of_words.each do |word|
      #   score_total << score(word)
      # end
      # return score_total
      #
      # highest_scoring_word = ""
      scores = array_of_words.group_by {|word| score(word)}

      max_score = scores.keys.max
      #returns array of keys, calls .max to find highest value keys
      #checks lenght of value(array of words) of key max_score
      if scores[max_score].length == 1
        scores[max_score].first
      else
      end
      # puts "#{scores}"
      #map {|word| score(word)}

      array_of_words.inject {|memo, word| score(word) > score(memo) ? word : memo }
      # highest_score = 0
      # array_of_words.each do |word|
      #
        # if score(word) > highest_score
        #   highest_scoring_word = word
        #   highest_score = score(word)

        ##ESLIFS from yesterday
      #   elsif score(word) == highest_score
      #     #if highest_scoring_word.length != word.length && highest_scoring_word.length != 7 && word.length != 7
      #     unless highest_scoring_word.length == 7 || word.length == 7
      #       if highest_scoring_word.length <= word.length
      #         highest_scoring_word = highest_scoring_word
      #       else
      #         highest_scoring_word = word
      #       end
      #     end
      #   elsif highest_scoring_word.length == 7 && word.length != 7
      #     highest_scoring_word = highest_scoring_word
      #   elsif highest_scoring_word.length != 7 && word.length == 7
      #     highest_scoring_word = word
      #   end
      #
      #
      #
      # end




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

# ap Scrabble::Scoring.highest_score_from_array(["cat", "doge"])
