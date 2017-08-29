# require_relative '../wave-1-game'

module Scrabble
  class Scoring

    SCORE_CHART = {"A" => 1, "E" => 1, "I" => 1,"O" => 1, "U" => 1, "L" => 1,  "N" => 1, "R" => 1,"S" => 1,"T" => 1, "D" => 2, "G" => 2,"B" => 3,"C" => 3,  "M" => 3, "P" => 3,   "F" => 4,"H" => 4,"V" => 4,"W" => 4,"Y" => 4,  "K" => 5,"J" => 8,"X" => 8, "Q" => 10, "Z" => 10,}
    #self.score will retun the score of the word passed in as an argument. If the word is seven letters a bonus 50 points will be added to the score.
    def self.score(word)
      word = word.upcase
      word_array = word.split(//)
      if word_array.length == 7
        word_score = 50
      else
        word_score = 0
      end
      word_array.each do |letter|
        word_score += SCORE_CHART[letter]
      end
      return word_score
    end #def self.score(word)

    #self.highest_score_from will return the highest scoring word in the array of words passed to the method as an argument. If there is a tie to for the highest scoring word the highest priority will be given to a seven letter word. If there is no seven letter word then the word using less tiles will be returned. If the tie is between words of the same length and score then the one with the lower index in the array will be returned.
    def self.highest_score_from(array_of_words)
      highest_score = 0
      highest_score_word = nil

      array_of_words.each do |word|
        word_score = Scrabble::Scoring.score(word)
        if word_score > highest_score
          highest_score = word_score
          highest_score_word = word.upcase
        elsif word_score == highest_score
          if word.length == 7
            highest_score_word = word.upcase
          elsif word.length < highest_score_word.length
            highest_score_word = word.upcase
          else
          end
        end #if/else
      end #.each
      return highest_score_word
    end # DEF

  end #Scoring
end #Scrabble
