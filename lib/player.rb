module Scrabble
  class PlayerClass
    attr_reader :name, :plays
    #name: returns the value of the @name instance variable
    #plays: returns an Array of the words played by the player
    def initialize(name)
      @name = name
      @plays = []
    end

    def total_score
      # total_score: Returns the sum of scores of played words
      running_score = 0
      @plays.each do |word|
        running_score += Scrabble::ScoringClass.score(word)
      end
      return running_score
    end

    def play(word)
      # Returns false if player has already won
      # Returns the score of the word
      @plays << word
      won? ? (return false) : (return Scrabble::ScoringClass.score(word))
    end

    def highest_scoring_word
      #highest_scoring_word: Returns the highest scoring played word
      return Scrabble::ScoringClass.highest_score_from(@plays)
    end

    def highest_word_score
      #highest_word_score: Returns the highest_scoring_word score
      # score highest scoring word
      Scrabble::ScoringClass.score(highest_scoring_word)
    end

    private

    def won?
      # won?: If the player has over 100 points, returns true, otherwise returns false
      # This should be a private method
      total_score >= 100 ? (return true) : (return false)
    end
  end
end
