require_relative 'Scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :highest_scoring_word, :highest_word_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @highest_scoring_word = nil
      @highest_word_score = 0
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

    def highest_scoring_word
      @highest_scoring_word = Scoring.highest_score_from(@plays)
      return @highest_scoring_word
    end

    def highest_word_score
      highest_scoring_word
      @highest_word_score = Scoring.score(@highest_scoring_word)

      return @highest_word_score
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
