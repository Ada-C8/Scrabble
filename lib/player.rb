require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :winning_word
    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      # @highest_scoring_word = Scoring.highest_score_from(@plays)
      # @highest_word_score = Scoring.score(@highest_scoring_word)
    end

    def play(word)
      @plays << word.upcase
      @total_score += Scoring.score(word)
      if won?
        return false
      else
        return Scoring.score(word)
      end
    end

    def return_highest_scoring_word
      @winning_word = Scoring.highest_score_from(@plays)
      return @winning_word
    end

    def return_highest_word_score
      return Scoring.score(winning_word)
    end

    private

    def won?
      @total_score > 100 ? true : false
    end

  end
end
