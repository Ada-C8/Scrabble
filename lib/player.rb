require_relative 'scrabble'

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      plays << word
      return word
    end

    def total_score
      return true
    end

    def highest_word_score
      return true
    end

    def highest_scoring_word
      return true
    end

    private

    def won
      return true
      # if total_score > 99
      #   return true
      # else
      #   return false
      # end
    end

  end # end of class
end #end of module
