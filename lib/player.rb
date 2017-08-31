require 'score'
require 'wave-1-game'
module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize
      @name = name
      @plays = [] #returns an array of words player has played
      # @total_score =
    end

    def self.play(word)
      if @name.won?
        return false
      # if @plays.include? word
      #   return false
      else
      @plays << word
      return word.Scrabble::Score.score
    end
  end
end

    def total_score
      total = 0
      @plays.each do |word|
        total += word.Scrabble::Score.score
      end
      return total
    end





#name: returns the value of the @name instance variable
#plays: returns an Array of the words played by the player
#play(word): Adds the input word to the plays Array
# Returns false if player has already won
# Returns the score of the word
#total_score: Returns the sum of scores of played words
#won?: If the player has over 100 points, returns true, otherwise returns false
# This should be a private method
#highest_scoring_word: Returns the highest scoring played word
#highest_word_score: Returns the highest_scoring_word score
