# require_relative 'wave-1-game'
module Scrabble
  class Score
    attr_reader :words
    def initialize
      @words = []
    end

    def self.score(word)
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
        score_chart.each do |number, letters|
          letters.find do |l|
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


    def self.highest_score_from_array(array_of_words)
      #longest = array_of_words.max_by{|word| Score.score(word) }
      tie = []
      max_so_far = -1

      array_of_words.each do |i|
        current_high_score = Scrabble::Score.score(i)
        if current_high_score > max_so_far do
          tie = []
          tie << i
          max_so_far = current_high_score
        end

        if current_high_score == max_so_far do
          tie << i
        end


      end
        #insert item with highest Score here
        #will need method from partner or other input here?

        if tie.length == 1
          return tie[0]
        else
          winner_winner = ""
          tie.each do |i|


        

        if #here is the case for 7 letter words, trumps other cases
          #bonus would be added in other (score?) method

        elsif #here is the case for fewest tiles winning the tie

        else #otherwise the first thing passed into the array
      end
    end


  end
end
