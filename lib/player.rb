require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    def play(word)
      @plays << word
      word_score = Scrabble::Scoring.score(word)
      @total_score += word_score
      
      return word_score
    end

  end #end of Player class

end #end of module
