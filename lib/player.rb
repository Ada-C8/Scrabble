require_relative 'scoring'
require 'awesome_print'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :tiles
    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def play(word)
      ap "Played word = #{word}"

      # if Dictionary.new(word) == false
      #   raise ArgumentError.new("That word is not in the dictionary!")
      # end


      tiles_copy = @tiles

      #if all the letters in word are present in the player's hand, then it will pass through this loop without raising an error.
      word.upcase.split("").each do |letter|
        if tiles_copy.include?(letter)
            tiles_copy.delete_at(tiles_copy.index(letter) || tiles_copy.length)
            ap "After removing tile form hand: #{tiles_copy}"
        else
          raise ArgumentError.new("The letter \"#{letter}\" is not in your hand.")
        end
      end

      @tiles = tiles_copy

      ap "Tiles in hand- tiles_copy: #{tiles_copy}"
      ap "Tiles in hand- tiles_copy: #{@tiles}"

      @plays << word.upcase
      @total_score += Scoring.score(word)

      if won?
        return false
      else
        return Scoring.score(word)
      end
    end

    def highest_scoring_word
      #sends player's array to highest_score_from and gets back the highest scoring word
      best_word = Scoring.highest_score_from(@plays)
      return best_word
    end

    def highest_word_score#(winning_word)
      # sends the highest_scoring_word method to the score method to be scored.
      highest_score = Scoring.score(highest_scoring_word)
      return highest_score
    end

    def draw_tiles(tile_bag)
      ap "Tiles in hand before player draws: #{@tiles}"
      draw = 7 - @tiles.length
      @tiles.concat(tile_bag.draw_tiles(draw)) #both this class and the TileBag class have draw_tiles methods.
      ap "Tiles in hand after player draws: #{@tiles}"
    end

    private

    def won?
      @total_score > 100 ? true : false
    end

  end
end
