require 'scoring'
require 'tilebag'



module Scrabble
  class Player
  attr_reader :name, :plays, :word_scores
    def initialize(name, tile_bag)
      @name = name
      @tile_bag = tile_bag
      @word_scores = []
      @plays = []
      @hand = []
    end

    def play(word)
      if won? == true
        return false
      end

      @plays << word
      @score = Scrabble::Scoring.score(word)
      @word_scores << @score
      return @score
    end

    def total_score
      if @word_scores.empty?
        return 0
      else
        return @word_scores.reduce(:+)
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from_array(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

    def draw_tiles
      if bag_empty?
        return "Sorry, you can't draw from an empty bag! Work with whatcha momma gave ya!"
      end

      num = 7 - @hand.length
      if num > @tile_bag.num_tiles_remaining
        num = @tile_bag.num_tiles_remaining
      end

      push_to_hand(@tile_bag.draw_tiles(num))
    end

    def bag_empty?
      if @tilebag.num_tiles_remaining == 0
        return true
      end
    end

    def push_to_hand(tiles_you_drew)
      @hand.push(tiles_you_drew)
      @hand.flatten
    end

private
    def won?
      if total_score >= 100
        return true
      else
        return false
      end
    end


  end
end
