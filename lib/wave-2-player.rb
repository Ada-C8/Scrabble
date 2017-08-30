module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []

    end

    def play(word)
      raise ArgumentError.new "input must be a String" if word.class != String
      @plays << word
    end

    def total_score
    end

    def won?
    end

    def highest_scoring_word
    end

    def highest_word_score
    end

  end  #end of Player class
end  #end of Scrabble module
