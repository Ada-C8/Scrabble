require 'scoring'



module Scrabble
  class Player
  attr_reader :name, :plays, :word_score
    def initialize(name)
      @name = name
      @word_scores = []
      @plays = []
    end

    def play(word)
      if won? == true
        return false
      end

      @plays << word
      @score = Scrabble::Scoring.score(word)
      @word_scores << @score
      return @score
    end

    def total_score
      if @word_scores.empty?
        return 0
      else
        return @word_scores.reduce(:+)
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from_array(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
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
