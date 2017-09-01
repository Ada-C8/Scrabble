# require_relative 'wave-1-game'
module Scrabble
  class Score
    attr_reader :words
    def initialize
      @words = []
    end

    # calculates the score of a given word
    def self.score(word)
	  word = word.upcase
      score_chart =
      {
        1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2 => ["D", "G"],
        3 => ["B", "C", "M", "P"],
        4 => ["F", "H", "V", "W", "Y"],
        5 => ["K"],
        8 => ["J", "X"],
        10 => ["Q", "Z"]
      }
      total = 0
      # extra_point = 50
      for i in 0..word.length
        score_chart.each do |number, letters|  # Loops through hash
          letters.find do |l|   # Iterates through letters of an array
            if l == word[i]
              total += number
            end
          end
        end
      end
      if word.length == 7
        return total + 50
      else
        return total
      end
    end

    # def self.highest_score_from_array(array_of_words)
    #   tie = []
    #   max_so_far = -1
    #   array_of_words.each do |i|
    #     current_high_score = Scrabble::Score.score(i)
    #     if current_high_score > max_so_far
    #       tie = []
    #       tie << i
    #       max_so_far = current_high_score
    #     elsif current_high_score == max_so_far
    #       tie << i
    #     # else
    #     end
    #   end
    #
    #
    #     if tie.length == 1
    #       return tie[0]
    #     else
    #       winner = ""
    #       min_length = 100
    #       tie.each do |i|
    #         if i.length == 7
    #           return i
    #         else
    #           # puts 'current is ' + i + " and min length is #{min_length}"
    #           if i.length < min_length
    #             winner = i
    #             min_length = i.length
    #           end
    #         end
    #       end
    #       return winner
    #     end
    # end

    # returns the word with the highest score
    def self.highest_score_from_array(array_of_words)
      longest = array_of_words.max_by{|word| Score.score(word) }
      longest_string = ""
      array_of_words.each do |word|
        if is_better_choice(longest_string, word)
          longest_string = word
        end
      end
      return longest_string
    end


     # returns true if word2 is better choice.
     def self.is_better_choice(word1, word2)
       score1 = score(word1)
       score2 = score(word2)
       if (score1 > score2)
         return false
       elsif (score2 > score1)
         return true
       else
         if (word1.length == 7)
           return false
         end
         if (word2.length == 7)
           return true
         end
         if (word2.length < word1.length)
           return true
         end
         return false
       end
     end
  end
end
