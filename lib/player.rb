module Scrabble
  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      if @plays != [] && won?
        return false
      else
        @plays << word.upcase
        return Scoring.score(word)
      end
    end

    def total_score
      total_score = @plays.map { |word| Scoring.score(word)}.reduce(:+)
      return total_score
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    private

    def won?
      if total_score <= 100
        return false
      else
        return true
      end
    end

  end
end
