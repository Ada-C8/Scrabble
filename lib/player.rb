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
      @total_score += Scoring.score(word)
      if won?
        return false
      else
        return Scoring.score(word)
      end
    end

    def highest_scoring_word
      #sends player's array to highest_score_from and gets back the highest scoring word
      best_word = Scoring.highest_score_from(@plays)
      return best_word
    end

    def highest_word_score#(winning_word)
      # sends the highest_scoring_word method to the score method to be scored.
      highest_score = Scoring.score(highest_scoring_word)
      return highest_score
    end

    private

    def won?
      @total_score > 100 ? true : false
    end

  end
end
