require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name, :plays, :total_score
    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0

    end

    def play(word)
      @plays << word.upcase
      # word = Scoring.new
      @total_score += Scoring.score(word)
      return Scoring.score(word)
    end

    def won?

    end

  end
end
