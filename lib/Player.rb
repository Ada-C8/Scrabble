require_relative 'Scoring'

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    #plays returns an Array of the words played by the player

    def play(word)
      #adds input word to plays Array
      #@plays << word

      #returns false if the player has already won
      #won?

      #returns score of the word
      #Scoring.score(word)
      #total_score(score)
    end

    def total_score(score)
      #@total_score += score
    end

    def highest_word_score
      #@plays.each do |play|
        #if play.score
        #...
    end


    private
    def won?
      #if score >100
        #return true
      #else
        #return false
    end






  end
end
