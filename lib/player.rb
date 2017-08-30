require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name, :plays
    def initialize(name)
      @name = name
      @plays = []

    end

    def play(word)
      @plays << word.upcase
      # word = Scoring.new


    end

    def won?

    end

  end
end
