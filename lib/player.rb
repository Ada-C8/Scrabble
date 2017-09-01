require_relative 'scoring'
# require_relative 'tilebag'
require 'pry'

module Scrabble
  class Player

  attr_accessor :name, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      return false if won?
      plays << word
      return Scrabble::Scoring.score(word)
      
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
