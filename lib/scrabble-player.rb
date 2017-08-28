require_relative "scrabble-scoring"

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      if won?
        return false
      else
        @plays << word
        returns Scrabble::Scoring.score(word)
      end
    end


    def total_score

    end

    def highest_scoring_word

    end

    def highest_word_score

    end


    private

    def won?

    end

  end
end
