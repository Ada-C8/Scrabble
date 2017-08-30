module Scrabble
  class Scoring
    SCORE_CHART = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]
    }

    def initialize

    end

    def self.score(word)

      unless word.class == String
        raise ArgumentError.new("Input must be a String")
      end

      word_caps = word.upcase
      word_arr = word_caps.split("")

      total_score = 0

      word_arr.each do |letter_from_user|
        SCORE_CHART.each do |score, letter_arr|
          letter_arr.each do |letter|
            if letter_from_user == letter
              total_score += score
            end
          end
        end
      end

      if word_arr.length == 7
        total_score += 50
      end

      return total_score
    end

    def self.highest_score_from_array(arr_of_words)

      unless arr_of_words.class == Array
        raise ArgumentError.new("Input must be an Array")
      end

      best_word = nil
      highest_score = 0

      arr_of_words.each do |word|
        word_score = Scrabble::Scoring.score(word)
        if word_score > highest_score
          highest_score = word_score
          best_word = word
        elsif word_score == highest_score #check for tie
          if best_word.length == 7 #then best_word remains the same
          elsif word.length == 7
            best_word = word
          else #neither of the words are 7 characters long
            if (best_word.length <=> word.length) == 1 #best_word is more letters
              best_word = word
            elsif (best_word.length <=> word.length) == -1 #best_word is less letters
            else #they are equal, and best_word remains the same
            end
          end
        else #word_score < highest_score
        end
      end

      return best_word
    end

  end # class
end # module

tester = Scrabble::Scoring.highest_score_from_array(["A", "ZZZZ", "THE"])
print tester

# a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
