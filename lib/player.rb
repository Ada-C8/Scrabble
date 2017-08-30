require_relative 'scoring'
module Scrabble
  class Player

  attr_accessor :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end
##plays: returns an Array of the words played by the player
    def play(word)
      plays << word
      return Scrabble::Scoring.score(word)
    end

    def total_score
      #sum = 0
      #plays.each { |a| sum+=a }
      sum = plays.inject(0, :+)
      return sum








    ##total_score: Returns the sum of scores of played words

    # Returns false if player has already won













  end #(class end)
end #(module)
