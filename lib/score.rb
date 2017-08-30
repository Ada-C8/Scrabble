# require_relative 'wave-1-game'
module Scrabble
  class Score
    attr_reader :words
    def initialize
      @words = []
    end

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
      tie = []
      max_so_far = -1

      array_of_words.each do |i|
        
        current_high_score = Scrabble::Score.score(i)
        if current_high_score > max_so_far
          tie = []
          tie << i
          max_so_far = current_high_score
        elsif current_high_score == max_so_far 
          tie << i
        else
          
        end
      end
      
      
        if tie.length == 1
          return tie[0]
        else
          winner = ""
          min_length = 100
          tie.each do |i|
            if i.length == 7
              return i
            else
              puts 'current is ' + i + " and min length is #{min_length}"
              if i.length < min_length 
                winner = i
                min_length = i.length
              end
            end
          end
          return winner
        end
      end   
  end
end