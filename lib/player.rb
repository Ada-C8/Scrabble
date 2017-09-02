require_relative 'score'

module Scrabble
  class Player
    attr_reader :name, :plays, :tiles
    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end


    def play(word)
      if won?
        return false
      else
        @plays << word
        return Scrabble::Score.score(word)
      end
    end
    # def play(word)
    #   valid_play = true
    #   word = word.upcase
    #   word.split("").each do |i|
    #     if !@tiles.include? i
    #       valid_play = false
    #     end
    #   end
    #   if valid_play
    #     if won?
    #       return false
    #     else
    #       @plays << word
    #       return Scrabble::Score.score(word)
    #     end
    #   else
    #     puts "You must use the tiles you have"
    #   end
    # end


    def total_score
      total_so_far = 0
      @plays.each do |i|
        total_so_far += Scrabble::Score.score(i)
      end
      return total_so_far
    end


    def won?
      total_score > 100 ? true : false
    end

    def highest_scoring_word
      return Scrabble::Score.highest_score_from_array(@plays)
    end

    def highest_word_score
      return Scrabble::Score.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      # fills tiles array until it has 7 letters from the given tile bag
      count = 7 - @tiles.length
      @tiles.concat(tile_bag.draw_tiles(count))# when used push, it pushes array inside of an array
    end
  end
end
