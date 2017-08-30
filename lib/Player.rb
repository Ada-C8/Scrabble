require_relative 'Scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end


    #plays returns an Array of the words played by the player
    def play(word)
      if won? == false #adds input word to plays Array
      @plays << word
      @total_score += Scoring.score(word)
      else
      return false
      end
      #returns false if the player has already won
      #won?
    end

    def highest_word_score
      #@plays.each do |play|
        #if play.score
        #...
    end


    private
    def won?
      if @total_score > 100
        return true
      else
        return false
      end
    end






  end
end
