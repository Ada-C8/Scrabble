require 'pry'

module Scrabble
  class Scoring
    #attr_reader :score
      @scoring_hash = {
        A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1, D: 2, G: 2, B: 3, C: 3, M: 3, P:3,
        F: 4, V: 4, W: 4, Y: 4, K: 5, J: 8, X: 8, Q: 10, Z: 10}
    def initialize
      # @scoring_hash = {
      # A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1, D: 2, G: 2, B: 3, C: 3, M: 3, P:3,
      #   F: 4, V: 4, W: 4, Y: 4, K: 5, J: 8, X: 8, Q: 10, Z: 10}
    end

      # self.score(word): returns the total score for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
      # A seven letter word means that a player used all the tiles. Seven letter words receive a 50 point bonus.
    def self.score(word)
      score = 0
      word = word.upcase
      word_arr = word.split("")
      word_arr.each do |letter|
        letter = letter.to_sym
        puts letter.class
        @scoring_hash.each do |key, value|
          if letter == key
            puts key
            score += value
          end
        end
      end
      if word_arr.length == 7
          score += 50
      end
      return score
    end

  end
end
