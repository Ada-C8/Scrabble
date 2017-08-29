require 'pry'

module Scrabble
  class Scoring
    #attr_reader :score
    @scoring_hash = {
      A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1, D: 2, G: 2, B: 3, C: 3, M: 3, P:3,
      F: 4, V: 4, W: 4, Y: 4, K: 5, J: 8, X: 8, Q: 10, Z: 10}
      def initialize
      end

      # self.score(word): returns the total score for the given word. The word is input as a string (case insensitive). The chart in the baseline requirements shows the point value for a given letter.
      # A seven letter word means that a player used all the tiles. Seven letter words receive a 50 point bonus.
      def self.score(word)
        score = 0
        word = word.upcase
        word_arr = word.split("")
        word_arr.each do |letter|
          letter = letter.to_sym
          @scoring_hash.each do |key, value|
            if letter == key
              score += value
            end
          end
        end
        if word_arr.length == 7
          score += 50
        end
        return score
      end

      def self.highest_score_from(array_of_words)
        highest_score = 0
        highest_score_word = nil

        array_of_words.each do |word|
          word_score = self.score(word)
          if word_score > highest_score
            highest_score = word_score
            highest_score_word = word.upcase
          elsif word_score == highest_score && (word.length == 7 || highest_score_word.length == 7)
            if word.length == 7
              highest_score_word = word.upcase
            end
          elsif word_score == highest_score && word.length < highest_score_word.length
            highest_score_word = word.upcase
          end
        end
        return highest_score_word
      end
    end
  end
