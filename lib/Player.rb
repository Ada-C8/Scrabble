require_relative 'Scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :highest_scoring_word, :highest_word_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    def play(word)
      return false if won?
      @total_score += Scoring.score(word)
      @plays << word
      @highest_scoring_word = Scoring.highest_score_from(@plays)
      @highest_word_score = Scoring.score(@highest_scoring_word)
      return Scoring.score(word)
    end

    def won?
      return @total_score >= 100
    end

  end
end
