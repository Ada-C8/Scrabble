# require_relative "scoring"
# require_relative "tilebag"

require 'pry'
module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @total_score = 0
      @plays = []
      @tiles = []
      raise ArgumentError.new("name must be a string") if (@name.class != String || @name.empty?)
    end



    def play(word)
      return false if won?
      # check that its possible from @tiles
      # check if it's an English Oxford word
      # how to add more tiles and delete the played tiles

      word.chars.each do |char|
        unless @tiles.include?(char)
          raise ArgumentError.new ("Error: Play the tiles you have")
        end
      end

      @plays << word
      @total_score += Scrabble::Scoring.score(word)

      # subtract word characters from @tiles AND call draw_tiles method
      word.chars.each do |char|
        to_delete = @tiles.index(char)
        @tiles.delete_at(to_delete)
        # p @tiles
      end

      # subtract tiles from @tiles (and hopefully @tiles gets refilled)
      # end
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
    #
    def tiles
      @tiles
    end

    def draw_tiles(tilebag)
      until @tiles.length == 7
        @tiles << tilebag.draw_tiles(1)
      end
      return @tiles
    end

    # fills tiles array until it has 7 letters from the given tile bag
    # if value is zero, you can't draw that key
    # need = 7 - @my_tiles.length
    # new_tiles = tilebag.draw_tiles(need)
    # new_tiles.each do |tile|
    #   @my_tiles << tile
    # end
    # end


    private
    def won?
      return (total_score > 100) #? true : false
    end

  end
end
# Manual tests to be deleted before final push:
# test = Scrabble::Player.new("Ada")
# puts test.tiles
# puts test.tiles
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
