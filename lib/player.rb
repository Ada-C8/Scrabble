require_relative 'scrabble'

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      # if won? return false
      plays << word
      return Scrabble::Scoring.score(word) # new instance of score
    end

    def total_score
      sum_of_scores = []
      @plays.each do |word|
        sum_of_scores << Scrabble::Scoring.score(word)
      end
      return sum_of_scores.inject(:+)
    end

    def highest_word_score
      num_hash = {}
      @plays.each do |word|
        num_hash[word] = Scrabble::Scoring.score(word)
      end

      return num_hash.values.max
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    private

    def won
      return true
      # if total_score > 99
      #   return true
      # else
      #   return false
      # end
    end

  end # end of class
end #end of module
