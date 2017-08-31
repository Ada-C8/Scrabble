# #name: returns the value of the @name instance variable
# #plays: returns an Array of the words played by the player

# #highest_scoring_word: Returns the highest scoring played word

# #highest_word_score: Returns the highest_scoring_word score

module Scrabble
  class PlayerClass
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = ["dog", "kitten", "panda"]
    end

    # total_score: Returns the sum of scores of played words
    def total_score
      running_score = 0
      @plays.each do |word|
        running_score += Scrabble::ScoringClass.score(word)
      end
      return running_score
    end

    # #play(word): Adds the input word to the plays Array
      # Returns false if player has already won
      # Returns the score of the word
    def play(word)

    end

    def highest_scoring_word
      # self.highest_from_array = highest_scoring_word
    end

    def highest_word_score
      Scrabble::ScoringClass.max_score
      # score highest scoring word 
    end

    private

    # #won?: If the player has over 100 points, returns true, otherwise returns false
     # This should be a private method
    def won?
      total_score >= 100 ? (return true) : (return false)
      # total_score >= 100
    end

  end
end



# def total_score(arr = nil)
#   plays = arr || @plays
# end
