# Create a Scrabble::Player class with a minimum of 11 specs. The only required parameter for instances of the class is the player's name. Instances of the class should repond to the following messages (note, this does not necessarily mean that each of these need to be written as new methods):
#
# #plays: returns an Array of the words played by the player
# #play(word): Adds the input word to the plays Array
# Returns false if player has already won
# Returns the score of the word
# #total_score: Returns the sum of scores of played words

# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score

module Scrabble
  class Player
    attr_reader :name, :player_words, :total_score
    def initialize(name)
      @name = name
      @player_words = []
      @total_score = 0
    end

    def plays#(play)
      return @player_words
    end #plays

    def play(word)
      @player_words << word
      result = Scrabble::Scoring.score(word)
      @total_score += result
      if won?
        return false
      else
        return result # Score of the word
      end
    end #play

    #TODO: calculate score of word and add to @total_score (use @total_score in won? method to determine if they have > 100 points)
    #TODO: return false if player has already won (won? == true)
    #TODO: else return the score for the word (won? == false)

    #TODO: highest_scoring word --- make a hash of words and their scores and return the highest scoring word? Or run soring method on @player_words to get the highest scoring word (sort by highest score and return last word in array)? BEST IDEA: call highest_score_from_array on @player_words to get the highest scoring word (Scrabble::Scoring.highest_score_from_array(@player_words)) and return the word

    #TODO: to get the highest word score... call Scrabble::Scoring(highest_scoring_word)



    private

    def won?
      # won?: If the player has over 100 points, returns true, otherwise returns false
      # This should be a private method
      if @total_score > 100
        return true
      else
        return false
      end
    end # DEF

  end # Player
end # Scrabble
