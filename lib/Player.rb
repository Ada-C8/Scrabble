require_relative 'Scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    def play(word)
      return false if won?
      @plays << word
      @total_score += Scoring.score(word)
    end

    private

    def won?
      return @total_score >= 100
    end

  end
end
