module Scrabble
  class Player
    # name: returns the value of the @name instance variable
    # plays: returns an Array of the words played by the player

    attr_reader :name, :plays

    def initialize(name)
      @name = name.to_s
      @plays = []
    end

    def play(word)
      @plays << word
      Scoring.score(word)
      # Returns false if player has already won
    end

    def total_score
      total = 0
      @plays.each do |word|
        total += Scoring.score(word)
      end
      return total
      # total_score: Returns the sum of scores of played words
    end

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end

    private
    def won?
      # won?: If the player has over 100 points, returns true, otherwise returns false
      return total_score > 100

      # This should be a private method
    end

  end # end of Player class
end # end of Scrabble module
