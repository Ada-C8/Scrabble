require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :played_words, :total_score
    def initialize(name)
      raise ArgumentError.new("Name must be a string") if name.class != String
      @name = name
      @played_words = []
      @total_score = 0
    end

    def name
      return @name
    end

    def total_score
      @played_words.each do |word|
        @total_score += Scrabble::Scoring.score(word)
      end
      return @total_score
    end

    def play(word)
      raise ArgumentError.new("Word must be a string") if word.class != String
      raise ArgumentError.new("Word must be 7 letters or less") if word.length > 7

      if self.total_score >= 100 #total_score is called every time player plays a word
        return false
      else
        @played_words << word
      end
    end

    private

    def won?
      if @total_score >= 100
        return true
      else
        return false
      end
    end
  end
end
