module Scrabble
  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      @plays << word.upcase
      return Scoring.score(word)
      # if won? == false
      #   @plays << word.upcase
      #   return Scoring.score(word)
      # else
      #   return false
      # end
    end

    def total_score
      total_score = @plays.map { |word| Scoring.score(word)}.reduce(:+)
      return total_score
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
