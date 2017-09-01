# require_relative 'player'

module Scrabble
 POINT_PER_VARIABLE = {
   "A" => 1,
   "B" => 3,
   "C" => 3,
   "D" => 2,
   "E" => 1,
   "F" => 4,
   "G" => 2,
   "H" => 4,
   "I" => 1,
   "J" => 8,
   "K" => 5,
   "L" => 1,
   "M" => 3,
   "N" => 1,
   "O" => 1,
   "P" => 3,
   "Q" => 10,
   "R" => 1,
   "S" => 1,
   "T" => 1,
   "U" => 1,
   "V" => 4,
   "W" => 4,
   "X" => 8,
   "Y" => 4,
   "Z" => 10
 }

 class Scoring
   attr_accessor :word, :score

   def initialize(word = "")
     @word =  word
     # @score = score
   end

   # self.score(word):
   #1. returns the total score for the given word.
   #2. The word is input as a string (case insensitive).
   #3.  Seven letter words receive a 50 point bonus.
   def self.score(word)
     # word_has_7?(word, points)
     points = 0
     word.each_char do |letter|
       points += POINT_PER_VARIABLE[letter.upcase]
     end
     word.length >= 7 ? points += 50 : points
   end

   #DOES THIS HAVE TO BE SELF.?
   def self.high_score_array(array)
     raise ArgumentError.new("No Plays") if array == []
     array.group_by{|word| Scoring.score(word)}.max.last
   end


   # self.highest_score_from(array_of_words):
   # returns the word in the array with the highest score.
   # In the case of tie:
   # 1. If the top score is tied between multiple words and is seven
   #   letters long, choose the one with seven letters over the one with #  fewer tiles.
   # 2. If the there are multiple words that are the same score and same
   #   length, pick the first one in the supplied list.
   # 3. It’s better to use fewer tiles, in the case of a tie, prefer the
   #    word with the fewest letters.

   def self.highest_score_from(array_of_words)
     highest_score_array = Scoring.high_score_array(array_of_words)

     if highest_score_array.length == 1
       return highest_score_array[0]
     else
       self.tie_break(highest_score_array)
     end
   end

   def self.tie_break(array)
     win_word = "zzzzzzz"
     array.each do |word|
       case
       when word.length ==7
         return word
       when win_word.length > word.length
         win_word = word
       end
     end
     win_word
   end

 end #self::Scoring
end #Module End
