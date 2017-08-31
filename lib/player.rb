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
        plays << word
        Scoring.score(word)
      end
    end
    # total_score: Returns the sum of scores of played words
    def total_score
      plays.inject(0) { |sum, word| sum + Scoring.score(word) }
    end

    # highest_scoring_word: Returns the highest scoring played word
    def highest_scoring_word
      Scoring.highest_score_from(plays)
    end

    # highest_word_score: Returns the highest_scoring_word score
    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    private
    # won?: If the player has over 100 points, returns true, otherwise returns false
    # This should be a private method
    def won?
      total_score > 100 ? true : false
    end
  end
end
