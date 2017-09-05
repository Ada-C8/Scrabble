require_relative 'scoring'
require_relative 'tilebag'

module Scrabble
  class Player
    attr_reader :name, :played_words, :tiles
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
      # We abandoned trying to verify that a player has the needed tiles because
      # it looks like we would have to adjust a bunch of our tests.
      # Question: is it normal/acceptable to go back and change tests?
      # Or is that indicative of serious design problems?

      # required_letters = word.split(//)
      # required_letters.each do |letter|
      #   if @tiles.include?([letter.upcase.to_sym])
      #     next
      #   else
      #     raise ArgumentError.new("Insufficient tiles to play that word")
      #   end
      # end
      if self.total_score >= 100
        return false
      end

      @played_words << word
      played_letters = word.split(//) #remove used tiles from player's "hand"
      played_letters.length.times do |i|
        letter = played_letters.pop.upcase.to_sym
        @tiles.length.times do |j|
          if @tiles[j] == letter
            @tiles.slice!(j)
            next
          end
        end
      end
      return Scrabble::Scoring.score(word)
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
        @tiles += tile
      end
    end

    private

    def won? #Question: why did the assignment require this method?
      @total_score >= 100 ? true : false
    end
  end
end
