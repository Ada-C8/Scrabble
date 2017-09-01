require_relative 'scoring'
require_relative 'tilebag'

module Scrabble
  class Player
    attr_reader :name, :played_words, :tiles#need to not have a reader that is the same as a method name
    def initialize(name)
      raise ArgumentError.new("Name must be a string") if name.class != String
      @name = name
      @played_words = []
      @total_score = 0
      @tiles = []
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
      end
      @played_words << word
      Scrabble::Scoring.score(word)
    end

    def plays
      return @played_words
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(@played_words)
    end

    def highest_word_score
      Scrabble::Scoring.score(self.highest_scoring_word)
    end

    def draw_tiles(bag) #takes instance of TileBag as parameter
      until @tiles.length == 7
        tile = bag.draw_tiles(1)
        @tiles << tile
      end
    end

    private

    def won?
      @total_score >= 100 ? true : false
    end
  end
end
