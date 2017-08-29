require_relative 'Scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :highest_scoring_word

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    def play(word)
      return false if won?
      @plays << word
      @total_score += Scoring.score(word)
      @highest_scoring_word = Scoring.highest_score_from(@plays)

      return Scoring.score(word)
      # @highest_word_score
    end

    def won?
      return @total_score >= 100
    end

  end
end
