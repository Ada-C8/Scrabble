require 'scoring'



module Scrabble
  class Player
  attr_reader :name, :plays
    def initialize(name)
      @name = name
    end

    def play(word)
      @plays = []
      if won? true
        return false
      end
      @plays << word
      @word_score = Scrabble::Scoring.score(word)
      total_score
    end

    def total_score
      total_scores = []
      total_scores << @word_score
    end


















  end
end
