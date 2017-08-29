module Scrabble
  class Scoring
    SCORE_HASH = {

      %w(A E I O U L N R S T) => 1,
      %w(D G) => 2,
      %w(B C M P) => 3,
      %w(F H V W Y) => 4,
      %w(K) => 5,
      %w(J X) => 8,
      %w(Q Z) => 10
    }  #letter_arr , letter_score

    def self.score(word)
      raise ArgumentError.new "Input must be a String class." if word.class != String
      word_score = 0

      raise ArgumentError.new "Word must be one to seven letters long." if word.length == 0 || word.length > 7

      letters = word.upcase.split("")
      letters.each do |letter|
        raise ArgumentError.new "Word must contain only regular ASCII letters." if !letter.match(/^[A-Z]$/)

        SCORE_HASH.each do |letter_arr, letter_score|
          if letter_arr.include? letter
            word_score += letter_score
          end
        end
      end

      if word.length == 7
        word_score += 50
      end
      return word_score
    end #end self.score

    def self.highest_score_from(array_of_words)
      raise ArgumentError.new "argument must be an Array" if array_of_words.class != Array

      raise ArgumentError.new "input Array cannot be empty" if array_of_words.length == 0


      words_hash = {}
      array_of_words.each do |word|
         words_hash[word] = Scrabble::Scoring.score(word)
      end
      words_hash.keys.sample
    end
  end #end class
end #end module
# p Scrabble::Scoring.highest_score_from(["one", "eleven", "hundred"])



# puts Scrabble::Scoring.score("Shaunna") #works



#     raise ArgumentError.new "Input must be a String class."
#     if word.class != String
#
#       raise ArgumentError.new "Word must be one to seven letters long."
#       if word == 0 && word > 7
#       end
#     end
#
#     total_score = 0
#     word.upcase.each_char do |letter|
#       SCORE_HASH.keys.each do |arr|
#         if arr.include? letter
#           total_score += SCORE_HASH[arr]
#         end
#       end
#     end
#   end
