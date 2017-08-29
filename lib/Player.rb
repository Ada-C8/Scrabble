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

      @plays << word
      @total_score += Scoring.score(word)
    end


  end
end
