module Scrabble
  class Player
    attr_reader :name, :plays, :total_score, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = [] #max 7
    end

    def play(word)

      unless word.class == String
        raise ArgumentError.new("Input must be a String")
      end

      if won?
        return false
      end

      @plays << word

      player_word_score = Scrabble::Scoring.score(word)

      @total_score += player_word_score

      return player_word_score
    end

    def highest_scoring_word
      highest_scoring_word = Scrabble::Scoring.highest_score_from(@plays)
      return highest_scoring_word
    end

    def highest_word_score
      best_word = highest_scoring_word
      highest_word_score = Scrabble::Scoring.score(best_word)
      return highest_word_score
    end

    def draw_tiles(tile_bag)#in wave_3_game passes an instane of TileBag stored in instance variable @tilebag of Game class

      tiles_needed = 7 - @tiles.length
      drawn_tiles = tile_bag.draw_tiles(tiles_needed)

      @tiles = @tiles + drawn_tiles
      return @tiles
    end

    private

    def won?
      if @total_score > 100
        return true
      end
      return false
    end
  end#Player

end#Scrabble


# #### Modifications to `Player`
# Create specs for (__minimum 2__) and add to the `Player` class the following instance methods:
#
# - `#tiles` a collection of letters that the player can play (max 7)
# - `#draw_tiles(tile_bag)` fills tiles array until it has 7 letters from the given tile bag
#     - It is not in the primary requirements to modify the existing `#play(word)` to use `#tiles` or check against the player's tiles
