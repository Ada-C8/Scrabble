require_relative 'scoring'
require_relative 'tile_bag'

module Scrabble
  class Player
    attr_accessor :name, :tiles

    def initialize(name)
      @name  = name
      @plays = []
      @tiles = []
    end

    def tiles
      if @tiles.length <= 7
        return @tiles
      else
        raise ArgumentError.new("Cannot select more than 7 tiles")
      end
    end

    def draw_tiles(tile_bag)
      puts "Inside draw_tiles, @tiles is #{@tiles}"
      tiles_to_draw = 7 - @tiles.length
      @tiles.concat(tile_bag.draw_tiles(tiles_to_draw))
      puts "after, @tiles is #{@tiles}"
      return @tiles
    end

    def plays
      return @plays
    end

    def play(word)
      if won? == false
        @plays << word
      end
    end

    def total_score
      total_score = 0
      @plays.each do |played_word|
        total_score += Scrabble::Scoring.score(played_word)
      end
      return total_score
    end

    def highest_scoring_word
      Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def won?
      if total_score < 100
        return false
      else
        return true
      end
    end

  end # end of the class
end # end of module

#####TESTING######

# bob = Scrabble::Player.new("bob")
# # tile_bag = Scrabble::TileBag.new
#
# puts bob.play("cats")
# puts
# puts bob.plays
# puts
# puts bob.play("dots")
# puts
# print bob.plays
# puts
# puts bob.play("books")
# puts
# print bob.plays
# puts bob.play("trouble")
# puts
# print bob.plays
# puts
# print bob.total_score
# puts
# puts bob.highest_scoring_word

####TESTING-2#########
# puts bob.tiles
# puts
# puts bob.play("cats")
# puts
# print bob.tiles
# puts
# print bob.draw_tiles(tile_bag)
# puts
# print bob.tiles
