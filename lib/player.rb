# Create a Scrabble::Player class with a minimum of 11 specs. The only required parameter for instances of the class is the player's name. Instances of the class should repond to the following messages (note, this does not necessarily mean that each of these need to be written as new methods):
#
# #name: returns the value of the @name instance variable
# #plays: returns an Array of the words played by the player
# #play(word): Adds the input word to the plays Array
# Returns false if player has already won
# Returns the score of the word
# #total_score: Returns the sum of scores of played words
# #won?: If the player has over 100 points, returns true, otherwise returns false
# This should be a private method
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score

module Scrabble
  class Player
    def initialize
      @name = name
    end


    
  end # Player
end # Scrabble
