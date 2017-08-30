require 'scoring'



module Scrabble
  class Player
  attr_reader :name, :plays
    def initialize(name)
      @name = name
      @word_score = []
      @plays = []
    end

    def play(word)
      if won? == true
        return false
      end
      @plays << word
      @score = Scrabble::Scoring.score(word)
      @word_score << @score
      return @score
    end

    def total_score
      if @word_score.empty?
        return 0
      else
        return @word_score.reduce(:+)
      end
    end

private
    def won?
      if total_score >= 100
        return true
      else
        return false
      end
    end


















  end
end
