
module Scrabble
  POINTPERVARIABLE = {
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

    # self.score(word): returns the total score for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
    # A seven letter word means that a player used all the tiles. Seven letter words receive a 50 point bonus.
    def self.scored(word)
      points = word_has_7?(word)
      word.each_char do |letter|
        points += POINTPERVARIABLE[letter.upcase]
      end
      points
    end

    def self.word_has_7?(word)
      if word.length >= 7
        50
      else
        0
      end
    end
  # self.highest_score_from(array_of_words): returns the word in the array with the highest score. In the case of tie, use these tiebreaking rules:
  # It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.
  # There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
  # If the there are multiple words that are the same score and same length, pick the first one in the supplied list.
  def self.highest_score_from(array_of_words)
    hash_of_scores = {}
    array_of_words.each do |word|
      value = scored(word)
      hash_of_scores[word] = value
    end
    puts hash_of_scores
    max_score = hash_of_scores.values.max
    #hash_of_scores max_score
  end
  #check if tie for max code



  end #self::Scoring
end #Module End

#
# array = ["wizard", "dog", "xray", "artery"]
# puts (Scrabble::Scoring.highest_score_from(array))
