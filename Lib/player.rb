require_relative 'scrabble'
require_relative 'tile_bag'
require 'pry'
module Scrabble
  class Player

    attr_accessor :name, :plays, :total_score, :tiles

    def initialize(name = "Pipes")
      @name = name
      @plays =[] #words played
      @total_score = 0
      @tiles = [] #will add all instances of Scoring class which are also each word in plays
    end

    def play(word)
      @plays << word
      word_score = Scoring.score(word)
      @total_score += word_score
      case
      when won?
        true
      when !won?
        word_score
      end
    end

    # highest_scoring_word: Returns the highest scoring played word
    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    #highest_word_score: Returns the highest_scoring_word score
    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tilebag)
    num = 7 - @tiles.length
    # tilebag << Scrabble::TileBag.remaining_tiles
    @tiles << tilebag.draw_tiles(num)

    end# end draw tiles
    private
    #won?: If the player has over 100 points returns true.
    # otherwise returns false
    def won?
      @total_score >= 100
    end

  end
end
