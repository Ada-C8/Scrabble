require_relative "scoring"

require 'pry'
module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @total_score = 0
      @plays = []
      raise ArgumentError.new("name must be a string") if (@name.class != String || @name.empty?)
    end



    def play(word)
      return false if won?
      @plays << word
      @total_score += Scrabble::Scoring.score(word)
    end

    #deleted this total_score and added it to play(word method)
    # def total_score
    #   @total_score = 0
    #   @plays.each do |word|
    #   @total_score += Scrabble::Scoring.score(word)
    #   end
    #   return @total_score
    # end

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end

    def tiles
      Scrabble::TileBag.draw_tiles(7)
    end

    private
    def won?
      return (total_score > 100) #? true : false
    end

  end
end

# Manual tests to be deleted before final push:
# test = Scrabble::Player.new("Ada")
#
# test.play("zzzzzzz")
# test.play("z")
# test.play("z")
# puts test.total_score
# # test.play("zzzzz")
#
# test.play("zzzzzx")
# test.play("z")
# test.play("cat")
# test.play("laurend")
# test.play("bat")
# puts test.total_score
# puts test.name
# puts test.highest_scoring_word
