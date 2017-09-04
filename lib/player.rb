require_relative 'scoring'

module Scrabble
  class Player

    attr_accessor :name, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    # Commented out code is an attempt at the optional requirement to allow player to only use tiles they currently have.  We struggled with how to implement many of our tests that have the players play words now that the tiles are an unknown, so we didn't fully implement.
    def play(word)
      return false if won?
      # word_array = word.upcase.split("")
      # if (word_array & @tiles).length == word_array.length
      plays << word
      #   word_array.each do |letter|
      #     @tiles.delete(letter)
      #   end
      return Scrabble::Scoring.score(word)
      # else
      #   return ArgumentError.new("You do not have the tiles to play that word.")
      # end
    end

    def total_score
      scores = []
      plays.each do |word|
        scores << Scrabble::Scoring.score(word)
      end
      sum = scores.inject(0, :+)
      return sum
    end

    def highest_word_score
      scores = []
      plays.each do |word|
        scores << Scrabble::Scoring.score(word)
      end
      return scores.max
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_scoring_word(@plays)
    end

    def draw_tiles(tile_bag)
      num = (7 - @tiles.length)
      drawn_tiles = tile_bag.draw_tiles(num)
      num.times do
        @tiles << drawn_tiles.pop
      end
    end

    private

    def won?
      return total_score > 100 ? true : false
    end

  end #(class end)
end #(module)
