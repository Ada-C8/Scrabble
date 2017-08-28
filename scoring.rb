require 'pry'

module Scrabble
  class Scoring

    def self.score(word)
      letter_values = {
        ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']=> 1,
        ['D', 'G'] =>	2,
        ['B', 'C', 'M', 'P'] =>	3,
        ['F', 'H', 'V', 'W', 'Y'] =>	4,
        ['K'] =>	5,
        ['J', 'X'] =>	8,
        ['Q', 'Z'] => 10
      }

      word = word.upcase.split("")

      total = 0
      word.each do |letter|
        letter_values.each do |letters, points|
          if letters.include?(letter)
            total += points
          end
        end
      end
      return total
    end



  end # end of class
end # end of module


# self.score(word): returns the total score for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
# Letter	Value


# A seven letter word means that a player used all the tiles. Seven letter words receive a 50 point bonus.
# self.highest_score_from(array_of_words): returns the word in the array with the highest score. In the case of tie, use these tiebreaking rules:
# It’s better to use fewer tiles, in the case of a tie, prefer the word with the fewest letters.
# There is a bonus for words that are seven letters. If the top score is tied between multiple words and one used all seven letters, choose the one with seven letters over the one with fewer tiles.
# If the there are multiple words that are the same score and same length, pick the first one in the supplied list.
